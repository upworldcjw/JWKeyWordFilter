//
//  JWKeywordFilterManager.m
//  JWKeyWordFilter
//
//  Created by jianwei on 12/07/16.
//  Copyright © 2016 AsiaInnovations. All rights reserved.
//

#include "JWKeywordFilterManager.h"
#import "aho_corasick.h"

@interface JWKeywordFilterManager (){
    aho_corasick::trie *_trie;
    NSRecursiveLock *_lock;
}
@end

@implementation JWKeywordFilterManager

+ (instancetype)shareInstance{
    static JWKeywordFilterManager *s_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[JWKeywordFilterManager alloc] init];
    });
    return  s_instance;
}

- (instancetype)init{
    if (self = [super init]) {
        _lock = [[NSRecursiveLock alloc] init];
        [self buildTrie];
    }
    return self;
}

- (void)buildTrie{
    if (_trie) {
        delete _trie;
    }
    _trie = new aho_corasick::trie;
    _trie->case_insensitive();//关键字可以大消息敏感，要过滤的字符串可以大小写不明感
    //    _trie->remove_overlaps();
    //    .only_whole_words()

}

- (void)reloadKeywords:(NSArray <NSString *> *)keywords{
    [_lock lock];
    [self buildTrie];
    [_lock unlock];
    [self insertKeyWords:keywords];
}

- (void)insertKeyWords:(NSArray <NSString *> *)keywords{
    //这里不仅是要过滤掉相同的关键词（忽略大小写）而且是为了兼容目前关键词相同的时候目前AC算法有问题
    NSMutableSet *mutSet = [NSMutableSet new];
    for(NSString *key in keywords){
        [mutSet addObject:[key lowercaseString]];//过滤相同的key.如果关键词有QQ，Qq，qq。只保留qq
    }
    //考虑关键词数量可能过大，分页优化。（遇到过5k左右关键词）
    NSArray *wordsArray = mutSet.allObjects;
    NSInteger count = [wordsArray count];
    NSInteger perRecyleCount = 300;
    NSInteger fullPageNum = count / perRecyleCount;     //记录多少完整perRecyleCount
    NSInteger notFullPageNum = count % perRecyleCount;  //最后一个不完整perRecyleCount的数量
    NSInteger pageIndex = 0;    //记录第几页
    NSInteger countIndex = 0;   //记录在wordsArray的index
    
    [_lock lock];
    while (pageIndex < fullPageNum) {
        @autoreleasepool {
            for (NSInteger i = 0 ;i < perRecyleCount; i++) {
                NSString *word = [[wordsArray objectAtIndex:countIndex++] lowercaseString];
                _trie->insert([word UTF8String]);
            }
        }//@autoreleasepool
        pageIndex ++;
    }
    for (NSInteger i = 0; i < notFullPageNum; i++) {
        NSString *word = [[wordsArray objectAtIndex:countIndex++] lowercaseString];
        _trie->insert([word UTF8String]);
    }
    [_lock unlock];
}


- (void)removeKeywords:(NSArray <NSString *> *)keywords{
    [_lock lock];
    //aho_corasick::trie 目前不支持remove方法
    [_lock unlock];
}


- (NSString *)filter:(NSString *)string replaceKeyWordWithString:(NSString *)replaceStr{
    [_lock lock];
    auto tokens = _trie->tokenise([string UTF8String]);
    size_t len = tokens.size();
    
    auto realStd = std::string();
    
    for (size_t i = 0; i < len; i ++) {
        
        aho_corasick::token<char> d = tokens[i];
        if (d.get_emit().get_keyword().length()>0) {
            realStd.append(replaceStr.UTF8String);
        }
        else{
            realStd.append(d.get_fragment());
        }
    }
    [_lock unlock];
    
    NSString *realString = [NSString stringWithCString:realStd.c_str()
                                              encoding:NSUTF8StringEncoding];

    return realString;
}


- (BOOL)isContainsProhibitedWords:(NSString *)msg{
    [_lock lock];
    auto result = _trie->parse_text([msg UTF8String]);
    [_lock unlock];
    
    BOOL isContain = NO;
    if (!result.empty()) {
        isContain = YES;
    }
    return isContain;
}

@end



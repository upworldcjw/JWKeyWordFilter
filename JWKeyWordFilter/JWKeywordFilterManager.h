//
//  JWKeywordFilterManager.h
//  JWKeyWordFilter
//
//  Created by jianwei on 12/07/16.
//  Copyright © 2016 AsiaInnovations. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface JWKeywordFilterManager : NSObject
//关键字是否固定，用来优化已经过滤过敏感词，之后再过滤字符串。优化用
@property (nonatomic, assign) BOOL permanent;
///是否大小写敏感
/*
 *设置后调用reloadKeywords:后生效
 */
@property (nonatomic, assign) BOOL insensitive;
///“敏感词”作为一个单词匹配，str = preStr+敏感词+fixStr，preStr最后一个字符是英文并且fixStr第一个字符是英文
/*
 *设置后调用reloadKeywords:后生效
 */
@property (nonatomic, assign) BOOL wordMatch;

+ (instancetype)shareInstance;

///删除当前所有关键词，重新加载关键词
- (void)reloadKeywords:(NSArray <NSString *> *)keywords;

///msg 是否包含关键词
- (BOOL)isContainsProhibitedWords:(NSString *)msg;

///将string中的所有关键词替换为replaceStr
- (NSString *)filter:(NSString *)string replaceKeyWordWithString:(NSString *)replaceStr;

@end


//
//  NSString+keyWord.m
//  JWKeyWordFilter
//
//  Created by jianwei on 12/07/16.
//  Copyright © 2016 AsiaInnovations. All rights reserved.
//

#import "NSString+keyWord.h"
#import "JWKeyWordFilterManager.h"
#import <objc/runtime.h>

static const void *kHadFilterKeyWord = &kHadFilterKeyWord;

@implementation NSString (keyWord)

- (void)setHadFilterKeyWord:(BOOL)hadFilterKeyWord{
    objc_setAssociatedObject(self, kHadFilterKeyWord, @(hadFilterKeyWord), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)hadFilterKeyWord{
    NSNumber *obj = objc_getAssociatedObject(self, kHadFilterKeyWord);
    if (obj) {
        return [obj boolValue];
    }
    return NO;
}

///是否包含
- (BOOL)jw_containsKeyWords{
    return [[JWKeyWordFilterManager shareInstance] isContainsProhibitedWords:self];
}


///敏感词替换为***
- (NSString *)jw_filterKeyWords{
    if([[JWKeyWordFilterManager shareInstance] permanent]){
        if (self.hadFilterKeyWord) {
            return self;
        }
        NSString *filter = [[JWKeyWordFilterManager shareInstance] filter:self replaceKeyWordWithString:@"***"];
        filter.hadFilterKeyWord = YES;
        return filter;
    }else{
        NSString *filter = [[JWKeyWordFilterManager shareInstance] filter:self replaceKeyWordWithString:@"***"];
        return filter;
    }
}

- (NSString *)jw_replaceKeywordsWithString:(NSString *)str{
    NSString *filter = [[JWKeyWordFilterManager shareInstance] filter:self replaceKeyWordWithString:str];
    return filter;
}


- (BOOL)jw_fullWordMatch{
    return [[JWKeyWordFilterManager shareInstance] isFullWordsMatch:self];
}

@end

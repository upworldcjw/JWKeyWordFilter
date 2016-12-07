//
//  NSString+keyWord.m
//  JWKeyWordFilter
//
//  Created by jianwei on 12/07/16.
//  Copyright © 2016 AsiaInnovations. All rights reserved.
//

#import "NSString+keyWord.h"
#import "JWKeywordFilterManager.h"
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

//敏感词过滤
- (BOOL)isContainsProhibitedWords{
    return [[JWKeywordFilterManager shareInstance] isContainsProhibitedWords:self];
}

///敏感词替换
- (NSString *)filterSensitiveWords {
    if (self.hadFilterKeyWord) {
        return self;
    }
    NSString *filter = [[JWKeywordFilterManager shareInstance] filter:self replaceKeyWordWithString:@"***"];
    filter.hadFilterKeyWord = YES;
    return filter;
}

@end

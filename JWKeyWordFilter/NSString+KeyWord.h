//
//  NSString+keyWord.h
//  JWKeyWordFilter
//
//  Created by jianwei on 12/07/16.
//  Copyright © 2016 AsiaInnovations. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (keyWord)
///如果JWKeywordFilterManager的permanent为YES则，字符串只会过滤一次
@property (nonatomic, assign, readonly) BOOL hadFilterKeyWord;

///是否包含
- (BOOL)jw_containsKeyWords;

///敏感词替换为***
- (NSString *)jw_filterKeyWords;

///将敏感词替换为指定字符串
- (NSString *)jw_replaceKeywordsWithString:(NSString *)str;

- (BOOL)jw_fullWordMatch;


@end

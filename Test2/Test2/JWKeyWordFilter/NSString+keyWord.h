//
//  NSString+keyWord.h
//  JWKeyWordFilter
//
//  Created by jianwei on 12/07/16.
//  Copyright © 2016 AsiaInnovations. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (keyWord)

@property (nonatomic, assign) BOOL hadFilterKeyWord;
///敏感词过滤
- (BOOL)isContainsProhibitedWords;

///敏感词替换
- (NSString *)filterSensitiveWords;

@end

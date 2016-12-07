//
//  JWKeywordFilterManager.h
//  JWKeyWordFilter
//
//  Created by jianwei on 12/07/16.
//  Copyright © 2016 AsiaInnovations. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface JWKeywordFilterManager : NSObject
//关键字是否固定，用来优化字符串
@property (nonatomic, assign) BOOL permanent;

+ (instancetype)shareInstance;

//删除当前所有关键词，重新加载关键词
- (void)reloadKeywords:(NSArray <NSString *> *)keywords;

////增加关键词keywords
//- (void)insertKeyWords:(NSArray <NSString *> *)keywords;

- (BOOL)isContainsProhibitedWords:(NSString *)msg;

- (NSString *)filter:(NSString *)string replaceKeyWordWithString:(NSString *)replaceStr;

@end


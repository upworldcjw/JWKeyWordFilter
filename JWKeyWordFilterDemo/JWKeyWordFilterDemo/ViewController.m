//
//  ViewController.m
//  JWKeyWordFilterDemo
//
//  Created by JianweiChenJianwei on 2016/12/7.
//  Copyright © 2016年 UL. All rights reserved.
//

#import "ViewController.h"
#import <JWKeyWordFilter/JWKeywordFilterManager.h>
#import <JWKeyWordFilter/NSString+keyWord.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //填充敏感词库如："qq"，".com"
    [[JWKeyWordFilterManager shareInstance] reloadKeywords:@[@"qq",@"baidu.com"]];
    
    //测试字符串
    NSString *testStr1 = @"习近平的qq公众号是1042294579你知道吗，不知道上baidu.com";
    
    //检查是否包含敏感词
    if ([testStr1 jw_containsKeyWords]) {
        NSLog(@"test1 conatin key world");
    }
    //过滤掉敏感词，用***替换
    NSString *filter = [testStr1 jw_filterKeyWords];
    NSLog(@"filter = %@",filter);
    
    //刷新关键词为："qq",".com","习近平"
    [[JWKeyWordFilterManager shareInstance] reloadKeywords:@[@"qq",@"baidu.com",@"习近平"]];
    
    //过滤掉敏感词，用***替换
    NSString *filter2 = [testStr1 jw_filterKeyWords];
    NSLog(@"filter2 = %@",filter2);
    
    //将敏感词替换为指定的字符串如：“@@@”
    NSString *filter3 = [testStr1 jw_replaceKeywordsWithString:@"@@@"];
    NSLog(@"filter3 = %@",filter3);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

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
    
    [[JWKeywordFilterManager shareInstance] reloadKeywords:@[@"qq",@".com"]];
    NSString *testStr1 = @"习近平的qq公众号是1042294579你知道吗，不知道上baidu.com";
    if ([testStr1 isContainsKeyWords]) {
        NSLog(@"test1 conatin key world");
    }
    NSString *filter = [testStr1 filterKeyWords];
    NSLog(@"filter = %@",filter);
    
    [[JWKeywordFilterManager shareInstance] reloadKeywords:@[@"qq",@".com",@"习近平"]];
    NSString *filter2 = [testStr1 filterKeyWords];
    NSLog(@"filter2 = %@",filter2);
    
    NSString *filter3 = [testStr1 replaceKeywordsWithString:@"@@@"];
    NSLog(@"filter3 = %@",filter3);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

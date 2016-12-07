# JWKeyWordFilter
the fastest  way to test a string whera contain key word,and replace the keyword with special string

EXAMPLE:
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
    
    
RESULT:  
filter = 习近平的***公众号是1042294579你知道吗，不知道上baidu***
filter2 = ***的***公众号是1042294579你知道吗，不知道上baidu***
filter3 = @@@的@@@公众号是1042294579你知道吗，不知道上baidu@@@

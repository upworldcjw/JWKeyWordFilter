# JWKeyWordFilter

A fastest way to valiaded a string whether contain key word；
A fastest way to  replace the keyword with special string

EXAMPLE:
    //填充敏感词库如："qq"，".com"
    [[JWKeywordFilterManager shareInstance] reloadKeywords:@[@"qq",@".com"]];
    
    //测试字符串
    NSString *testStr1 = @"习近平的qq公众号是1042294579你知道吗，不知道上baidu.com";
    
    //检查是否包含敏感词
    if ([testStr1 isContainsKeyWords]) {
        NSLog(@"test1 conatin key world");
    }
    //过滤掉敏感词，用***替换
    NSString *filter = [testStr1 filterKeyWords];
    NSLog(@"filter = %@",filter);
    
    //刷新关键词为："qq",".com","习近平"
    [[JWKeywordFilterManager shareInstance] reloadKeywords:@[@"qq",@".com",@"习近平"]];
    //过滤掉敏感词，用***替换
    NSString *filter2 = [testStr1 filterKeyWords];
    NSLog(@"filter2 = %@",filter2);
    
    //将敏感词替换为指定的字符串如：“@@@”
    NSString *filter3 = [testStr1 replaceKeywordsWithString:@"@@@"];
    NSLog(@"filter3 = %@",filter3);
    
    
//上面测试结果分别输出为：
filter = 习近平的***公众号是1042294579你知道吗，不知道上baidu***
filter2 = ***的***公众号是1042294579你知道吗，不知道上baidu***
filter3 = @@@的@@@公众号是1042294579你知道吗，不知道上baidu@@@

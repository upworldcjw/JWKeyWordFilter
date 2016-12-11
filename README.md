# JWKeyWordFilter

A fastest way to valiaded a string whether contain key word；<br>
A fastest way to  replace the keyword with special string<br>

EXAMPLE:<br>
 //填充敏感词库如："qq"，".com"<br>
 [[JWKeywordFilterManager shareInstance] reloadKeywords:@[@"qq",@".com"]];<br>

//测试字符串<br>
   NSString *testStr1 = @"习近平的qq公众号是1042294579你知道吗，不知道上baidu.com";<br>

//检查是否包含敏感词<br>
if ([testStr1 isContainsKeyWords]) {<br>
    NSLog(@"test1 conatin key world");<br>
}<br>
//过滤掉敏感词，用***替换<br>
NSString *filter = [testStr1 filterKeyWords];<br>
NSLog(@"filter = %@",filter);<br>
    
//刷新关键词为："qq",".com","习近平"<br>
[[JWKeywordFilterManager shareInstance] reloadKeywords:@[@"qq",@".com",@"习近平"]];<br>
    
//过滤掉敏感词，用***替换<br>
NSString *filter2 = [testStr1 filterKeyWords];<br>
NSLog(@"filter2 = %@",filter2);<br>
    
//将敏感词替换为指定的字符串如：“@@@”<br>
NSString *filter3 = [testStr1 replaceKeywordsWithString:@"@@@"];<br>
NSLog(@"filter3 = %@",filter3);<br>

    
//上面测试结果分别输出为：<br>
h1 filter = 习近平的***公众号是1042294579你知道吗，不知道上baidu***<br>
h1 filter2 = ***的***公众号是1042294579你知道吗，不知道上baidu***<br>
h1 filter3 = @@@的@@@公众号是1042294579你知道吗，不知道上baidu@@@<br>

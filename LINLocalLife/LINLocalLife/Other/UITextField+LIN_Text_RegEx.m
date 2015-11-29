//
//  UITextField+LIN_Text_RegEx.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/29.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "UITextField+LIN_Text_RegEx.h"

@implementation UITextField (LIN_Text_RegEx)


- (BOOL)isEmpty
{
    return self.text.length == 0;
}
- (BOOL)validateEmail
{
    return [self validateWithRegExp: @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}
- (BOOL)validateAuthen
{
    return [self validateWithRegExp: @"^\\d{,}$"];
}
- (BOOL)validatePassword
{
    NSString * length = @"^\\w{,}$";    //长度
    NSString * number = @"^\\w*\\d+\\w*$";   //数字
    NSString * lower = @"^\\w*[a-z]+\\w*$";   //小写字母
    NSString * upper = @"^\\w*[A-Z]+\\w*$";  //大写字母
    return [self validateWithRegExp: length] && [self validateWithRegExp: number] && [self validateWithRegExp: lower] && [self validateWithRegExp: upper];
}
- (BOOL)validatePhoneNumber
{
    NSString * reg = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    return [self validateWithRegExp: reg];
}

- (BOOL)validateWithRegExp: (NSString *)regExp
{
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", regExp];
    return [predicate evaluateWithObject: self.text];
}

- (BOOL)validate_6_18_Password{
    NSString * reg = @"(^[A-Za-z0-9]{6,18}$)";
    return [self validateWithRegExp:reg];
}

/*
 下面，列举一个匹配6-15个由字母/数字组成的字符串的正则表达式，来看看 NSPredicate 的具体使用：
 
 NSString * regex        = @"(^[A-Za-z0-9]{6,15}$)";
 NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
 BOOL isMatch            = [pred evaluateWithObject:@"123456ABCde"];
 下面是一些常用的正则表达式
 //邮箱
 + (BOOL) validateEmail:(NSString *)email
 {
 NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
 NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
 return [emailTest evaluateWithObject:email];
 }
 
 
 //手机号码验证
 + (BOOL) validateMobile:(NSString *)mobile
 {
 //手机号以13， 15，18开头，八个 \d 数字字符
 NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
 NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
 return [phoneTest evaluateWithObject:mobile];
 }
 
 
 //车牌号验证
 + (BOOL) validateCarNo:(NSString *)carNo
 {
 NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
 NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
 NSLog(@"carTest is %@",carTest);
 return [carTest evaluateWithObject:carNo];
 }
 
 
 //车型
 + (BOOL) validateCarType:(NSString *)CarType
 {
 NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
 NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
 return [carTest evaluateWithObject:CarType];
 }
 
 
 //用户名
 + (BOOL) validateUserName:(NSString *)name
 {
 NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
 NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
 BOOL B = [userNamePredicate evaluateWithObject:name];
 return B;
 }
 
 
 //密码
 + (BOOL) validatePassword:(NSString *)passWord
 {
 NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
 NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
 return [passWordPredicate evaluateWithObject:passWord];
 }
 
 
 //昵称
 + (BOOL) validateNickname:(NSString *)nickname
 {
 NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
 NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
 return [passWordPredicate evaluateWithObject:nickname];
 }
 
 
 //身份证号
 + (BOOL) validateIdentityCard: (NSString *)identityCard
 {
 BOOL flag;
 if (identityCard.length <= 0) {
 flag = NO;
 return flag;
 }
 NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
 NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
 return [identityCardPredicate evaluateWithObject:identityCard];
 }
 其实iOS中有三种方式来实现正则表达式的匹配。现在将他们都记录在这里：
 1.利用NSPredicate（谓词）匹配
 例如匹配有效邮箱：
 NSString ＊email ＝ @“nijino_saki@163.com”；
 NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
 BOOL isValid = [predicate evaluateWithObject:email];
 谓词匹配比较灵活，但是需要有谓词的相关知识。
 2.利用rangeOfString：option：直接查找
 NSString *searchText = @"// Do any additional setup after loading the view, typically from a nib.";
 NSRange range = [searchText rangeOfString:@"(?:[^,])*\\." options:NSRegularExpressionSearch];
 if (range.location != NSNotFound) {
 NSLog(@"%@", [searchText substringWithRange:range]);
 }
 options中设定NSRegularExpressionSearch就是表示利用正则表达式匹配，会返回第一个匹配结果的位置。
 3.使用正则表达式类
 NSString *searchText = @"// Do any additional setup after loading the view, typically from a nib.";
 NSError *error = NULL;
 NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(?:[^,])*\\." options:NSRegularExpressionCaseInsensitive error:&error];
 NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
 if (result) {
 NSLog(@"%@\n", [searchText substringWithRange:result.range]);
 }
 使用系统的正则表达式类（NSRegularExpression）会返回匹配的多个结果。
 小结：
 第一种匹配需要学习NSPredicate的写法，需要查阅苹果相关技术文档；如果只关心第一个匹配的结果，第二种匹配较为简洁；如果需要匹配多个结果，同时匹配多次，第三种方式效率会更高。
 */


@end

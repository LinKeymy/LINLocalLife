//
//  UITextField+LIN_Text_RegEx.h
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/29.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LIN_Text_RegEx)


/*! 判断文本框是否为空（非正则表达式）*/
- (BOOL)isEmpty;
/*! 判断邮箱是否正确*/
- (BOOL)validateEmail;
/*! 判断验证码是否正确*/
- (BOOL)validateAuthen;
/*! 判断密码格式是否正确*/
- (BOOL)validatePassword;
/*! 判断手机号码是否正确*/
- (BOOL)validatePhoneNumber;
/*! 自己写正则传入进行判断*/
- (BOOL)validateWithRegExp: (NSString *)regExp;

- (BOOL)validate_6_18_Password;

@end

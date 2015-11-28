//
//  UIColor+Cate.h
//  LINCITY
//
//  Created by 林荣安 on 15/11/21.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Cate)


+ (instancetype)randColor;


+ (instancetype)colorWithHexString:(NSString *)colorStr alpha:(CGFloat)alpha;
@end

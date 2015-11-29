//
//  LINBaseViewC.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/25.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINBaseViewC.h"
#import "MBProgressHUD.h"
#import "UIColor+Cate.h"
#import "UIView+Toast.h"

@implementation LINBaseViewC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.bounds = (CGRect){0,0,300,100};
    textLayer.position = self.view.center;
    [self.view.layer addSublayer:textLayer];
    textLayer.foregroundColor = (GET_GLOBAL_COLOR).CGColor;
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.wrapped = YES;
    UIFont *font = [UIFont systemFontOfSize:25];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    textLayer.string = @"欢迎来到小安的世界";
}

@end

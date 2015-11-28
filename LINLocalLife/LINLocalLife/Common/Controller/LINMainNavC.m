//
//  LINMainNavC.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/25.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINMainNavC.h"

@interface LINMainNavC ()

@end

@implementation LINMainNavC

- (void)viewDidLoad {
    [super viewDidLoad];
}

+ (void)initialize{
    [super initialize];
   UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
//    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor randColor];
    bar.translucent = NO;
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [bar setTitleTextAttributes:dict];
}


@end

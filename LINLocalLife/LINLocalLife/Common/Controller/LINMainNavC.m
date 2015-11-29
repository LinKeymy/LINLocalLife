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
    [self.navigationBar setTintColor:[UIColor whiteColor]];
}

+ (void)initialize{
    [super initialize];
   UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    bar.barTintColor = GET_GLOBAL_COLOR;
    bar.translucent = NO;
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:22]};
    [bar setTitleTextAttributes:dict];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count == 1) {
        self.isTabbarHidden(YES);
    }
    [super pushViewController:viewController animated:animated];
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    if (self.childViewControllers.count == 2) {
        self.isTabbarHidden(NO);
    }
   return [super popViewControllerAnimated:animated];
}

@end

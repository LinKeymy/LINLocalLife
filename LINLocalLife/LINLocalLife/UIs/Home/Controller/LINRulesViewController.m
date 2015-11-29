//
//  LINRulesViewController.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/29.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINRulesViewController.h"
#import "LINMainNavC.h"
#import "LINNavBarView.h"

@interface LINRulesViewController ()


@end

@implementation LINRulesViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    LINNavBarView *bar = [[LINNavBarView alloc] init];
    [self.view addSubview:bar];
    [bar setLeftButtonWithBackroundimge:[UIImage imageNamed:@"nav_back"] title:nil actionBlock:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [bar setTitle:@"用户使用条例"];
    [bar setRightButtonWithBackroundimge:nil title:@"登录／注册" actionBlock:^{
    }];
    bar.backgroundColor = GET_GLOBAL_COLOR;
    self.view.backgroundColor = [UIColor whiteColor];
}



@end

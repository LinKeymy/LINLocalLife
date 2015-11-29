//
//  LINRegisteViewController.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/29.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINRegisteViewController.h"
#import "LINRegisterView.h"
#import "LINBaseViewC.h"
#import "LINRulesViewController.h"

@interface LINRegisteViewController ()

@end

@implementation LINRegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClicked:)];
    [self.navigationItem setTitle:@"注册"];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]} forState:UIControlStateNormal];
    CGFloat navBarH = self.navigationController.navigationBar.h;
  CGRect registeRect = CGRectInset(self.view.bounds, 20, -navBarH);
    LINRegisterView *registeView = [[LINRegisterView alloc] initWithFrame:registeRect];
    [self.view addSubview:registeView];
    registeView.modelToRulesBlock = ^{
        LINRulesViewController *destinateController = [[LINRulesViewController alloc] init];
        [self presentViewController:destinateController
                           animated:YES
                         completion:nil];
    };
}

- (void)leftBarButtonItemClicked:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

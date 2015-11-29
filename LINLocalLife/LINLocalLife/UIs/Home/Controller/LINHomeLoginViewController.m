//
//  LINHomeLoginViewController.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/28.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINHomeLoginViewController.h"
#import "LINLoginView.h"
#import "LINRegisteViewController.h"
#import "linBaseViewC.h"

@interface LINHomeLoginViewController ()

@end

@implementation LINHomeLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"登录";
    UIImage *image = [UIImage imageNamed:@"nav_back"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithImage:image
                                             style:UIBarButtonItemStylePlain
                                             target:self
                                             action:@selector(leftItemClicked:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    CGRect loginRect = self.view.bounds;
    CGFloat constants = 3 *CGRectGetMaxY(self.navigationController.navigationBar.frame);
    loginRect.size.height -= constants;
    loginRect = CGRectInset(loginRect, 30, 0);
    loginRect.origin.y += constants / 4;
    LINLoginView *loginView = [[LINLoginView alloc] initWithFrame:loginRect];
    loginView.pushToRegisterBlock = ^{
        LINRegisteViewController *registeViewController = [[LINRegisteViewController alloc] init];
        [self.navigationController pushViewController:registeViewController animated:YES];
    };
    loginView.pushToSuccessViewBlock = ^{
        LINBaseViewC *base = [[LINBaseViewC alloc] init];
        [self.navigationController pushViewController:base animated:YES];
    };
    [self.view addSubview:loginView];
    

}


- (void)leftItemClicked:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

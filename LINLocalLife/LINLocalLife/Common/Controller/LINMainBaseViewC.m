//
//  LINMainBaseViewC.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/25.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINMainBaseViewC.h"
#import "LINMainNavC.h"
#import "LINTabbarView.h"
//tabbar concerned controller
#import "LINHomeCollectionV.h"
#import "LINCircleController.h"
#import "LINHotsC.h"
#import "LINToolsController.h"
#import "LINOnliveViewController.h"
#import "LINShakeViewController.h"
#import "LINUsC.h"
#import "LINXmppViewController.h"


@interface LINMainBaseViewC ()

@property(nonatomic, strong) UIViewController *currentViewController;
@property(nonatomic, weak) LINTabbarView *tabbarView;


@end

@implementation LINMainBaseViewC

- (void)viewDidLoad{
    [super viewDidLoad];
    NSArray *controllerArray = @[@"LINHomeCollectionV",@"LINHotsC",@"LINCircleController",@"LINOnliveViewController",@"LINXmppViewController",@"LINShakeViewController",@"LINOnliveViewController",@"LINUsC"];
    
    LINTabbarView *tabbarView = [[LINTabbarView alloc] initWithFrame:(CGRect){0,self.view.h - 49 * 2,self.view.w,49 * 2}];

    [self.view addSubview:tabbarView];
    
    self.tabbarView = tabbarView;
    for (int i = 0; i < controllerArray.count; i++) {
        Class className = NSClassFromString(controllerArray[i]);
        UIViewController *ViewController = [[className alloc] init];
        
        LINMainNavC *navC = [[LINMainNavC alloc] initWithRootViewController:ViewController];
        
            navC.isTabbarHidden = ^(BOOL isHidden){
                self.tabbarView.hidden = isHidden;
        };
        ViewController.navigationItem.title = NSStringFromClass([className class]);
        ViewController.view.backgroundColor = [UIColor randColor];
        navC.view.backgroundColor = [UIColor randColor];
        [self addChildViewController:navC];
    }
    
    tabbarView.pushControllerBlock = ^(UIButton *sender){
        [self.currentViewController.view removeFromSuperview];
        UIViewController *viewControllr = self.childViewControllers[sender.tag];
        [self.view addSubview:viewControllr.view];
        self.currentViewController = viewControllr;
        [self.view bringSubviewToFront:tabbarView];
    };
}

@end

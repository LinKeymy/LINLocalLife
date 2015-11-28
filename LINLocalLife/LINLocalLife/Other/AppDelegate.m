//
//  AppDelegate.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/22.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "AppDelegate.h"
#import "LINGuideViewC.h"
#import "LINMainBaseViewC.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UICollectionViewFlowLayout *flowLayout =  [[UICollectionViewFlowLayout alloc] init];
    [application setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    LINGuideViewC *guideViewC = [[LINGuideViewC alloc] initWithCollectionViewLayout:flowLayout];
    LINMainBaseViewC *mainC = [[LINMainBaseViewC alloc] init];

    guideViewC.goHomeBlock = ^{
    
        self.window.rootViewController = mainC;
    };
    self.window.rootViewController = mainC;
    [self.window makeKeyAndVisible];
    return YES;
}



@end

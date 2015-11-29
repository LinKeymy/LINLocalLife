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

#define NotfirstUsing  @"first"


@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LINGuideViewC *guideViewC = [[LINGuideViewC alloc] init];
    LINMainBaseViewC *mainC = [[LINMainBaseViewC alloc] init];
    //使用偏好保持是否是第一次使用的信息
    if (![[NSUserDefaults standardUserDefaults] valueForKey:NotfirstUsing]) {
        self.window.rootViewController = guideViewC;
        guideViewC.goHomeBlock = ^{
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setValue:@NO forKey:NotfirstUsing];
            self.window.rootViewController = mainC;
        };
    }else{
        self.window.rootViewController = mainC;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}



@end

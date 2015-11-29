//
//  LINMainNavC.h
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/25.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef  void(^TabbarHiddenBlock)(BOOL);


@interface LINMainNavC : UINavigationController

@property(nonatomic, copy) TabbarHiddenBlock isTabbarHidden;

@end

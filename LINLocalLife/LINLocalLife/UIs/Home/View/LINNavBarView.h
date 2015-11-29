//
//  LINNavBarView.h
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/29.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LINNavBarView : UIView


@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) UIColor *titleColor;
@property(nonatomic, weak) UIView *titleView;

- (void)setTitle:(NSString *)title withTexgtSize:(CGFloat)size;

- (void)setLeftButtonWithBackroundimge:(UIImage *)image title:(NSString *)title actionBlock:(void(^)()) block;
- (void)setRightButtonWithBackroundimge:(UIImage *)image title:(NSString *)title actionBlock:(void(^)()) block;

@end

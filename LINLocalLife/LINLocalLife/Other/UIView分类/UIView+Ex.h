//
//  UIView+Ex.h
//  day19-ui-CAanimation
//
//  Created by apple on 15/10/15.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Ex)

@property (nonatomic,assign)CGFloat x;
@property (nonatomic,assign)CGFloat y;
@property (nonatomic,assign)CGFloat w;
@property (nonatomic,assign)CGFloat h;
@property (nonatomic,assign,readonly)CGPoint innerCenter;
@property (nonatomic,assign)CGSize size;
@property (nonatomic,assign)CGPoint origin;

- (void) distributeSpacingHorizontallyWith:(NSArray*)views;
- (void) distributeSpacingVerticallyWith:(NSArray*)views;


- (UIView *)addUnderLinetextFiedWith:(UIImage *)leftImage placeholder:(NSString *)placeholder lineColor:(UIColor *)lineColor cornerRadius:(CGFloat)cornerRadius;
@end

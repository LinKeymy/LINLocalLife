//
//  LINNavBarView.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/29.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINNavBarView.h"

@interface LINNavBarView ()

@property(nonatomic, copy) void(^leftBtnBlock)();
@property(nonatomic, copy) void(^rightBtnBlock)();

@property(nonatomic, weak) UIView *barWrapView;
@property(nonatomic, weak) UILabel *titleLabel;

@end



@implementation LINNavBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    frame = (CGRect){0,0,kScreenW,NORMAL_NAVBAR_H};
    self = [super initWithFrame:frame];
    if (self) {
        UIView *barWrapView = [[UIView alloc] init];
        barWrapView.tintColor = [UIColor whiteColor];
        [self addSubview:barWrapView];
        self.barWrapView = barWrapView;
        [barWrapView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(self);
            make.height.mas_equalTo(NORMAL_NAVBAR_H - 20);
        }];
    }
    return self;
}

- (instancetype)init{
  self = [self initWithFrame:CGRectZero];
    return self;
}

- (void)setLeftButtonWithBackroundimge:(UIImage *)image title:(NSString *)title actionBlock:(void(^)()) block{
    UIButton *leftBtn = [[UIButton alloc] init];
    leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    self.leftBtnBlock = block;
    [leftBtn setBackgroundImage:image forState:UIControlStateNormal];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.barWrapView addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.barWrapView);
    }];
    [leftBtn sizeToFit];

}


- (void)setRightButtonWithBackroundimge:(UIImage *)image title:(NSString *)title actionBlock:(void(^)()) block{
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    self.rightBtnBlock = block;
    [rightBtn setBackgroundImage:image forState:UIControlStateNormal];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightClicked:) forControlEvents:UIControlEventTouchUpInside];
     [rightBtn sizeToFit];
    [self.barWrapView addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.top.equalTo(self.barWrapView);
    }];
   
}


- (void)setTitle:(NSString *)title withTexgtSize:(CGFloat)size{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:size];
    titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel = titleLabel;
    [self.barWrapView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.barWrapView);
    }];
}

- (void)setTitle:(NSString *)title{
    [self setTitle:title withTexgtSize:22];
}

- (void)setTitleView:(UIView *)titleView{
    [self.titleLabel removeFromSuperview];
    [self.barWrapView addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.barWrapView);
        make.height.mas_equalTo(titleView.h);
        make.width.mas_equalTo(titleView.w);
    }];
}

- (void)setTitleColor:(UIColor *)titleColor{
    self.titleLabel.textColor = titleColor;
}


//事件响应
- (void)leftBtnClicked:(UIButton *)sender{
    self.leftBtnBlock();
}
- (void)rightClicked:(UIButton *)sender{
    self.rightBtnBlock();
}



@end

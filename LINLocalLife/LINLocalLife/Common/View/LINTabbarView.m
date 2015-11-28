//
//  LINTabbarView.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/27.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINTabbarView.h"
#define kBottomBarBtnCount 5




@interface LINTabbarView ()

@property(nonatomic, weak) UIView *wrapView;
@property(nonatomic, weak) UIView *topWrapView;
@property(nonatomic, weak) UIButton *currentSelectedBtn;




@end

@implementation LINTabbarView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
          CGRect wrapRect = (CGRect){0,CGRectGetMaxY(self.bounds) - 49,self.w,self.h / 2};
        UIView *wrapView = [[UIView alloc] initWithFrame:wrapRect];
        UIView *topWrapView = [[UIView alloc] init];
    
        topWrapView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"home_topbar"].CGImage);
        [self addSubview:wrapView];
        [self insertSubview:topWrapView belowSubview:wrapView];
        
        [topWrapView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.height.equalTo(wrapView.mas_height);
        }];
//        topWrapView.alpha = 0.0;
        self.topWrapView = topWrapView;
        self.wrapView = wrapView;
        wrapView.backgroundColor = [UIColor blackColor];
        
        //botton部分
        for (int i = 0; i < kBottomBarBtnCount; i++) {
            NSString *imageName = [NSString stringWithFormat:@"home_%d",i];
            NSString *selImageName = [NSString stringWithFormat:@"home_%d_pressed",i];
            [self addButtonWithImageName:imageName selImageName:selImageName tag:i];
        }
        [wrapView distributeSpacingHorizontallyWith:wrapView.subviews];
        
        //top部分
        NSArray *titleArray = @[@"联系商家",@"摇一摇",@"直播",@"关于"];
        for (int i = 5; i < 9; i++) {
            [self addBtnWithTitle:titleArray[i-5] tag:i];
        }
        [topWrapView distributeSpacingHorizontallyWith:topWrapView.subviews];
    }
    return self;
}


- (void)addButtonWithImageName:(NSString *)imageName selImageName:(NSString *)selImageName tag:(NSInteger)tag{
    UIButton *btn = [[UIButton alloc] init];
    btn.tag = tag;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
    [self.wrapView addSubview:btn];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
     CGFloat btnW = self.wrapView.w / kBottomBarBtnCount;
     CGFloat btnH = [UIImage imageNamed:imageName].size.height;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(btnW));
        make.height.equalTo(@(btnH));
        make.bottom.equalTo(self.wrapView.mas_bottom);
    }];
}

- (void)addBtnWithTitle:(NSString *)title tag:(NSInteger)tag{
    UIButton *btn = [[UIButton alloc] init];
    btn.tag = tag;
    btn.backgroundColor = [UIColor cyanColor];
    btn.layer.backgroundColor = [UIColor redColor].CGColor;
    [btn setTitle:title forState:UIControlStateNormal];
    [self.topWrapView addSubview:btn];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.topWrapView);
    }];
    switch (tag) {
        case 5:
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(225 / 2 -40));
            }];
            break;
        case 6:
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(225 / 2 -20));
            }];
            break;
        case 7:
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(150 / 2));
            }];
            break;
        case 8:
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(150 / 2));
            }];
            break;
        default:
            break;
    }
}

- (void)btnClicked:(UIButton *)sender{
    
    if (self.pushControllerBlock) {
        self.pushControllerBlock(sender);
    }
    sender.selected = YES;
    self.currentSelectedBtn.selected = NO;
    self.currentSelectedBtn = sender;
    if (sender.tag == 4) {
        if (sender.selected == YES) {
            [UIView animateWithDuration:.3 animations:^{
                [self.topWrapView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self.wrapView.mas_top);
                }];
                self.topWrapView.alpha = 1.0;
            }];
        }
     }
    if(sender.tag != 4) {
        [UIView animateWithDuration:.3 animations:^{
           [self.topWrapView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.wrapView.mas_bottom);
               self.topWrapView.alpha = 0;
        }];
        }];
    }
        
        
}


- (void)willMoveToSuperview:(UIView *)newSuperview{
    [self btnClicked:self.wrapView.subviews[0]];
}
@end

//
//  LINRegisterView.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/29.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINRegisterView.h"
#import "LINRegisterModel.h"

static const CGFloat normalTextFieldH = 40;
static const CGFloat intervalH = 30;

@interface LINRegisterView ()

@property(nonatomic, strong) NSArray *underLintextFieldInfos;


@end

@implementation LINRegisterView

- (NSArray *)underLintextFieldInfos{
    if (!_underLintextFieldInfos) {
        NSMutableArray *temp = [LINRegisterModel mj_objectArrayWithFilename:@"registe.plist"];
        _underLintextFieldInfos = [temp copy];
    }
    return _underLintextFieldInfos;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

// - -- - -- - - -
#pragma mark --布局view
- (void)setupUI{
    //top 部分
    UIView *underTextFieldsWrapVeiw = [[UIView alloc] init];
    [self addSubview:underTextFieldsWrapVeiw];
    [underTextFieldsWrapVeiw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(80);
        make.left.right.equalTo(self);
        NSLog(@"testing baby-------> %ld", self.underLintextFieldInfos.count);
        make.height.equalTo(@(self.underLintextFieldInfos.count * (normalTextFieldH + intervalH)));
    }];
    [self.underLintextFieldInfos enumerateObjectsUsingBlock:^(LINRegisterModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
#warning -- if the plist is empty,layout broken.
         UIView *view = [self addUnderLinetextFiedWith:[UIImage imageNamed:model.icon] placeholder:model.placeholder lineColor:GET_GLOBAL_COLOR cornerRadius:5];
        if (idx == 4) {
            UIView *newView = [[UIView alloc] init];
            UIButton *getMessageBtn = [[UIButton alloc] init];
            getMessageBtn.backgroundColor = GET_GLOBAL_COLOR;
            [getMessageBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
            getMessageBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            getMessageBtn.layer.cornerRadius = 5;
            getMessageBtn.layer.masksToBounds = YES;
            [getMessageBtn sizeToFit];
            [newView addSubview:view];
            [newView addSubview:getMessageBtn];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.bottom.equalTo(newView);
                make.width.equalTo(newView).multipliedBy(.55);
            }];
            [getMessageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.top.bottom.equalTo(newView);
                make.width.equalTo(newView).multipliedBy(.4);
                make.height.equalTo(@(normalTextFieldH));
            }];
            [underTextFieldsWrapVeiw addSubview:newView];
            //这里指针又指了回来
            view = newView;
        }
        [underTextFieldsWrapVeiw addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(underTextFieldsWrapVeiw);
            make.height.equalTo(@(normalTextFieldH));
        }];

    }];
    [underTextFieldsWrapVeiw distributeSpacingVerticallyWith:underTextFieldsWrapVeiw.subviews];
    
    //bottom部分
    UIButton *registNowBtn = [[UIButton alloc] init];
    registNowBtn.layer.cornerRadius = 5;
    registNowBtn.layer.masksToBounds = YES;
    [registNowBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    [registNowBtn setTintColor:[UIColor whiteColor]];;
    registNowBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    registNowBtn.backgroundColor = [UIColor randColor];
    
    
    UIButton *rulesLeftBtn = [[UIButton alloc] init];
    rulesLeftBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    UIButton *rulesRighttBtn = [[UIButton alloc] init];
    [rulesLeftBtn setImage:[UIImage imageNamed:@"btn_normal"] forState:UIControlStateNormal];
    [rulesLeftBtn setImage:[UIImage imageNamed:@"btn_selected"] forState:UIControlStateSelected];
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:@"同意《用户使用条例的内容》"
                                                                  attributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)}];
    [rulesRighttBtn setAttributedTitle:attrStr forState:UIControlStateNormal];
    [rulesLeftBtn addTarget:self action:@selector(rulesLeftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [rulesRighttBtn addTarget:self action:@selector(rulesRightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:registNowBtn];
    [self addSubview:rulesLeftBtn];
    [self addSubview:rulesRighttBtn];
    
    [registNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(underTextFieldsWrapVeiw.mas_bottom).offset(normalTextFieldH);
        make.centerX.equalTo(self);
        make.width.equalTo(underTextFieldsWrapVeiw.mas_width).multipliedBy(.8);
        make.height.equalTo(@(normalTextFieldH));
    }];
    
    [rulesLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(registNowBtn.mas_left);
        make.top.equalTo(registNowBtn.mas_bottom);
        make.height.mas_equalTo(normalTextFieldH * .8);
        make.width.equalTo(rulesLeftBtn.mas_height);
    }];
    
    [rulesRighttBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(rulesLeftBtn.mas_right).offset(0);
        make.top.equalTo(registNowBtn.mas_bottom);
        make.right.equalTo(registNowBtn.mas_right);
        make.height.equalTo(rulesLeftBtn.mas_height);
    }];
    
}

#pragma --响应事件
- (void)rulesLeftBtnClicked:(UIButton *)sender{

    sender.selected = !sender.selected;
}

- (void)rulesRightBtnClicked:(UIButton *)sender{
        self.modelToRulesBlock();
}

@end

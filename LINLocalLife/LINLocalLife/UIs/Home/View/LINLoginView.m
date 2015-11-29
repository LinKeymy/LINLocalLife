//
//  LINLoginView.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/28.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINLoginView.h"

static const CGFloat geanerlH = 40;


@interface LINLoginView ()

@property(nonatomic, weak) UITextField *userNameField;
@property(nonatomic, weak) UITextField *passwordField;

@property(nonatomic, weak) UIButton *remPasswordLabel;
@property(nonatomic, weak) UIButton *forgotPasswordLabel;

@property(nonatomic, weak) UIButton *loginBtn;
@property(nonatomic, strong) NSArray *thirdLoginBtns;




@end

@implementation LINLoginView

- (NSArray *)thirdLoginBtns{
    if (!_thirdLoginBtns) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"third_login.plist" ofType:nil];
        NSArray *thirdLoginBtnIconNames = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSString *iconName in thirdLoginBtnIconNames) {
            UIButton *btn = [[UIButton alloc] init];
            [btn setBackgroundImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
            [tempArray addObject:btn];
        }
        _thirdLoginBtns = [tempArray copy];
    }
    return _thirdLoginBtns;
}


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    //name
    UITextField *userNameField = [[UITextField alloc] init];
    UIImageView *imageV = [[UIImageView alloc] init];;
    imageV.image = [UIImage imageNamed:@"login_user"];
    imageV.frame = (CGRect){0,0,geanerlH,geanerlH};
    userNameField.leftView = imageV;
    userNameField.leftView.backgroundColor = GET_GLOBAL_COLOR;
    userNameField.backgroundColor = COLORWiTH(115, 200, 253);
    userNameField.leftViewMode = UITextFieldViewModeAlways;
    userNameField.layer.cornerRadius = geanerlH * .1;
    userNameField.layer.masksToBounds = YES;
    userNameField.font = [UIFont systemFontOfSize:22];
    userNameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"用户名" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //password
    UITextField *passwordField = [[UITextField alloc] init];
    passwordField.font = [UIFont systemFontOfSize:22];
    passwordField.layer.cornerRadius = geanerlH * .1;
    passwordField.layer.masksToBounds = YES;
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    passwordField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_password"]];
    passwordField.leftView.backgroundColor = GET_GLOBAL_COLOR;
    passwordField.backgroundColor = COLORWiTH(115, 200, 253);
    passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"6-12位 仅限数字与字母" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
#pragma mark 光标的设置
    [[UITextField appearance] setTintColor:[UIColor redColor]];
    
    UIView *passwordWrapView = [[UIView alloc] init];

    
    UIButton *remPasswordBtn = [[UIButton alloc] init];
    UIButton *forgotPasswordBtn = [[UIButton alloc] init];
    UIView *passBottonWrapView = [[UIView alloc] init];
    [passBottonWrapView addSubview:remPasswordBtn];
    [passBottonWrapView addSubview:forgotPasswordBtn];
    
    [remPasswordBtn setTitle:@"记住密码" forState:UIControlStateNormal];
    [remPasswordBtn setImage:[UIImage imageNamed:@"btn_normal"] forState:UIControlStateNormal];
    [remPasswordBtn setTitleColor:COLORWiTH(57, 199, 217) forState:UIControlStateNormal];
    [remPasswordBtn setImage:[UIImage imageNamed:@"btn_selected"] forState:UIControlStateSelected];
    [remPasswordBtn addTarget:self action:@selector(remPasswordBtnClicked:) forControlEvents:UIControlEventTouchDown];
#warning button的富文本，也是新知识
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:@"忘记密码?" attributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSForegroundColorAttributeName:COLORWiTH(57, 199, 217),NSFontAttributeName:[UIFont systemFontOfSize:19]}];
    [forgotPasswordBtn setAttributedTitle:attrStr forState:UIControlStateNormal];
    
#warning 添加sizetofit之后可以不用添加宽度的约束
    [remPasswordBtn sizeToFit];
    [forgotPasswordBtn sizeToFit];

    UIView *spaceView = [[UIView alloc] init];
    
   //login
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:23];
    loginBtn.backgroundColor = GET_GLOBAL_COLOR;
    loginBtn.layer.cornerRadius = geanerlH * .1;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn addTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //registe
    UIButton *registeBtn = [[UIButton alloc] init];
    [registeBtn setTitle:@"还没有帐号？立即注册" forState:UIControlStateNormal];
    [registeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    registeBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [registeBtn addTarget:self action:@selector(registeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //third login
    UIView *thirdLoginView = [[UIView alloc] init];
    
    UILabel *thirdLoginLabel = [[UILabel alloc] init];
    thirdLoginLabel.textAlignment = NSTextAlignmentCenter;
    [thirdLoginLabel setText:@"第三方登录"];
    UIView *seperatorLine = [[UIView alloc] init];
    seperatorLine.backgroundColor = [UIColor redColor];
    
    UIView *thirdBtnWrapView = [[UIView alloc] init];
    
    [thirdLoginView addSubview:thirdLoginLabel];
    [thirdLoginView addSubview:seperatorLine];
    [thirdLoginView addSubview:thirdBtnWrapView];
    
 

    //没有注册的情况
    UIView *notCountWrapView = [[UIView alloc] init];
    [notCountWrapView addSubview:registeBtn];
    [notCountWrapView addSubview:thirdLoginView];
    [self addSubview:userNameField];
    [self addSubview:passwordWrapView];
    [self addSubview:spaceView];
    [self addSubview:loginBtn];
    [self addSubview:notCountWrapView];
    
    
    [passwordWrapView addSubview:passwordField];
    [passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(passwordWrapView);
        make.height.equalTo(@(geanerlH));
    }];
    [remPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(passBottonWrapView);
    }];
    
    [forgotPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(passBottonWrapView);
    }];
    
    [passwordWrapView addSubview:passBottonWrapView];
    [passBottonWrapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(passwordWrapView);
        make.top.equalTo(passwordField.mas_bottom);
    }];
    
    
    for (UIButton *btn in self.thirdLoginBtns) {
        [thirdBtnWrapView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(@30);
            make.top.equalTo(thirdBtnWrapView);
        }];
    }
    [userNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(geanerlH));
        make.left.right.equalTo(self);
    }];
    [passwordWrapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(geanerlH + 30));
    }];
    
    [spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(userNameField.mas_height);
        make.left.right.equalTo(self);
    }];
    
    [notCountWrapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(4 * geanerlH));
    }];

    [self distributeSpacingVerticallyWith:self.subviews];
    
    [registeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(notCountWrapView);
        make.height.equalTo(userNameField.mas_height);
    }];
    
    [thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(3 * geanerlH));
        make.left.right.equalTo(notCountWrapView);
        make.top.equalTo(registeBtn.mas_bottom).offset(-10);
    }];
    
    [thirdLoginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(thirdLoginView);
        make.height.equalTo(@(geanerlH * .3));
    }];
    
    [seperatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(thirdLoginView);
        make.height.equalTo(@1);
    }];
    
    [thirdBtnWrapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(thirdLoginView);
        make.height.equalTo(@(geanerlH * 1.5));
    }];
    [thirdLoginView distributeSpacingVerticallyWith:thirdLoginView.subviews];
    [thirdBtnWrapView distributeSpacingHorizontallyWith:thirdBtnWrapView.subviews];
    
    
}


#pragma mark -- 响应事件
- (void)remPasswordBtnClicked:(UIButton *)sender{
    sender.selected = !sender.selected;
}


- (void)registeBtnClicked:(UIButton *)sender{
    if (self.pushToRegisterBlock) {
        self.pushToRegisterBlock();
    }
}

- (void)loginBtnClicked:(UIButton *)sender{


}

@end

//
//  LINBaseViewC.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/25.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINBaseViewC.h"
#import "MBProgressHUD.h"
#import "UIColor+Cate.h"
#import "UIView+Toast.h"

@implementation LINBaseViewC
{
    MBProgressHUD *_hud;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randColor];
}

- (void)showLoadView{
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    [_hud show:YES];
    [self.view addSubview:_hud];
}

- (void)removeHud{
    if (_hud) {
        [_hud removeFromSuperViewOnHide];
    }
    [_hud hide:YES];
}

- (void)showToast:(NSString *)message{
    [self.view makeToast:message];
}
@end

//
//  LINLoginView.h
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/28.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^PushBlock)();

@interface LINLoginView : UIView

@property(nonatomic, copy) PushBlock pushToRegisterBlock;
@property(nonatomic, copy) PushBlock pushToSuccessViewBlock;

@end

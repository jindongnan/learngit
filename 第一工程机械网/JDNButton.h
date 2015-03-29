//
//  JDNButton.h
//  作业0306
//
//  Created by DongnanJin on 15/3/6.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JDNButton;
typedef void (^block)(JDNButton *button);
@interface JDNButton : UIButton
+(JDNButton *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title andBlock:(block)tempBlock;

+(JDNButton *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title backgroundImage:(NSString *)background image:(NSString *)image andBlock:(block)tempBlock;
@end

//
//  JDNButton.m
//  作业0306
//
//  Created by DongnanJin on 15/3/6.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "JDNButton.h"
@interface JDNButton()
@property(nonatomic,copy)block myBlock;
@end
@implementation JDNButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(JDNButton *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title andBlock:(block)tempBlock{
    JDNButton *button = [JDNButton buttonWithType:type];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.myBlock = tempBlock;
    return button;
}

-(void)buttonClicked:(JDNButton *)button{
    NSLog(@"这里是button点击触发");
    button.myBlock(button);
}

+(JDNButton *)buttonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title backgroundImage:(NSString *)background image:(NSString *)image andBlock:(block)tempBlock{
    JDNButton *button = [JDNButton buttonWithType:type];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:192.0/255.0 green:57.0/255.0 blue:153.0/255.0 alpha:100] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button addTarget:button action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setBackgroundImage:[UIImage imageNamed:background] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    button.myBlock = tempBlock;
    
    return button;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

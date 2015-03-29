//
//  NewsModel.h
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject


@property(nonatomic,copy)NSString *newsid;
@property(nonatomic,copy)NSString *newstitle;
@property(nonatomic,copy)NSString *newstime;
@property(nonatomic,copy)NSString *newsimg;
@property(nonatomic,copy)NSString *newsmemo;
@property(nonatomic,copy)NSString *newschatnum;
+(NewsModel *)modeWithDic:(NSDictionary *)dic;
@end

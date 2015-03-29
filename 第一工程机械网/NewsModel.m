//
//  NewsModel.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
+(NewsModel *)modeWithDic:(NSDictionary *)dic{
    return [[NewsModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end


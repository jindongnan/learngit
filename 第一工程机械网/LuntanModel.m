//
//  LuntanModel.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "LuntanModel.h"

@implementation LuntanModel
+(LuntanModel *)modelWithDic:(NSDictionary *)dic{
    return [[LuntanModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end

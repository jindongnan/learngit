//
//  ImagesModel.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "ImagesModel.h"

@implementation ImagesModel

+(ImagesModel *)imageWithDic:(NSDictionary *)dic{
    return [[ImagesModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end

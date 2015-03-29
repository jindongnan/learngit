//
//  LuntanModel.h
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LuntanModel : NSObject
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *subject;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *lastpostdate;
@property(nonatomic,copy)NSString *lastposter;
@property(nonatomic,copy)NSString *views;
@property(nonatomic,copy)NSString *replies;
@property(nonatomic,copy)NSString *displayorder;
@property(nonatomic,copy)NSString *digest;
@property(nonatomic,copy)NSString *attachment;
@property(nonatomic,copy)NSString *closed;
@property(nonatomic,copy)NSString *Page;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,copy)NSString *fid;
@property(nonatomic,copy)NSString *moderators;
@property(nonatomic,copy)NSString *tcid;
@property(nonatomic,copy)NSString *tid;
+(LuntanModel *)modelWithDic:(NSDictionary *)dic;
@end

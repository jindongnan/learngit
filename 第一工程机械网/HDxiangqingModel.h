//
//  HDxiangqingModel.h
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDxiangqingModel : NSObject
@property(nonatomic,copy)NSString *actid;
@property(nonatomic,copy)NSString *acttitle;
@property(nonatomic,copy)NSString *actimg;
@property(nonatomic,copy)NSString *actpeoplenum;
@property(nonatomic,copy)NSString *actstarttime;
@property(nonatomic,copy)NSString *actendtime;
@property(nonatomic,copy)NSString *acttopeople;
@property(nonatomic,copy)NSString *actcontent;
@property(nonatomic,copy)NSString *actplayway;
@property(nonatomic,copy)NSString *actstatus;
@property(nonatomic,copy)NSString *actrule;
@property(nonatomic,copy)NSString *actphone;

+(HDxiangqingModel *)datasWithDic:(NSDictionary *)dic;

@end

//
//  HuodongCell.h
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HuodongModel;
@interface HuodongCell : UITableViewCell

@property(nonatomic,strong)UIImageView *leftImage;
@property(nonatomic,strong)UIImageView *huodongImage;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *duixiangLabel;
@property(nonatomic,strong)UILabel *renshuLabel;
@property(nonatomic,strong)UILabel *jiangpinLabel;

@property(nonatomic,strong)HuodongModel *myModel;
+(HuodongCell *)huodongCellWithTableView:(UITableView *)tableView;

@end

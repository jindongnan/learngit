//
//  LuntanCell.h
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LuntanModel;
@interface LuntanCell : UITableViewCell

@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *liuyanLabel;
@property(nonatomic,strong)UILabel *liulanLabel;
@property(nonatomic,strong)UIImageView *liuyanImage;
@property(nonatomic,strong)UIImageView *liulanImage;
@property(nonatomic,strong)UIImageView *sanjiaoImage;

@property(nonatomic,strong)LuntanModel *myModel;
+(LuntanCell *)luntanCellWithTableView:(UITableView *)tableView;
@end

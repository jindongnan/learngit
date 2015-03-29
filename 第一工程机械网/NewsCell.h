//
//  NewsCell.h
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;
@interface NewsCell : UITableViewCell

@property(nonatomic,strong)UIImageView *leftView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *neirongLabel;

@property(nonatomic,strong)NewsModel *myModel;
+(NewsCell *)newsCellWithTableView:(UITableView *)tableView;
@end

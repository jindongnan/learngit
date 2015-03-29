//
//  HuodongCell.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "HuodongCell.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "HuodongModel.h"

@implementation HuodongCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        [self.contentView addSubview:_leftImage];
        
        _huodongImage = [[UIImageView alloc]initWithFrame:CGRectMake (10, CGRectGetMaxY(_leftImage.frame)+10, 80, 30)];
        _huodongImage.image = [UIImage imageNamed:@"imghuodongjieshu"];
        
        [self.contentView addSubview:_huodongImage];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImage.frame)+10, 5, 210, 20)];
        _nameLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.contentView addSubview:_nameLabel];
        
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImage.frame)+10, CGRectGetMaxY(_nameLabel.frame)+5, 210, 15)];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_timeLabel];
        
        _duixiangLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImage.frame)+10, CGRectGetMaxY(_timeLabel.frame)+5, 210, 15)];
        _duixiangLabel.font = [UIFont systemFontOfSize:13];
        _duixiangLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_duixiangLabel];
        
        _renshuLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImage.frame)+10, CGRectGetMaxY(_duixiangLabel.frame)+5, 210, 15)];
        _renshuLabel.font = [UIFont systemFontOfSize:13];
        _renshuLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_renshuLabel];
        
        _jiangpinLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImage.frame)+10, CGRectGetMaxY(_renshuLabel.frame), 210, 40)];
        _jiangpinLabel.font = [UIFont systemFontOfSize:13];
        _jiangpinLabel.textColor = [UIColor grayColor];
        _jiangpinLabel.numberOfLines = 2;
        [self.contentView addSubview:_jiangpinLabel];
    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

+(HuodongCell *)huodongCellWithTableView:(UITableView *)tableView{
    static NSString *ident = @"cell";
    
    HuodongCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        cell = [[HuodongCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}

-(void)setMyModel:(HuodongModel *)myModel{
    _myModel = myModel;
    
    [_leftImage setImageWithURL:[NSURL URLWithString:_myModel.actimg]];
    
    _nameLabel.text = _myModel.acttitle;
    _timeLabel.text = [NSString stringWithFormat:@"活动时间:%@-%@",_myModel.actstarttime,_myModel.actendtime];
    _duixiangLabel.text = [NSString stringWithFormat:@"参与对象:%@",_myModel.acttopeople];
    _renshuLabel.text = [NSString stringWithFormat:@"参与人数:%@",_myModel.actpeoplenum];
    _jiangpinLabel.text = [NSString stringWithFormat:@"奖品设置:%@",_myModel.actawardset];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  LuntanCell.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "LuntanCell.h"
#import "LuntanModel.h"
#import "UIKit+AFNetworking.h"

@implementation LuntanCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 285, 30)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        
        [self.contentView addSubview:_titleLabel];
    
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_titleLabel.frame)+10, 65, 20)];
        _nameLabel.font = [UIFont boldSystemFontOfSize:13];
        _nameLabel.textColor = [UIColor blueColor];
        
        [self.contentView addSubview:_nameLabel];
        
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_nameLabel.frame), CGRectGetMaxY(_titleLabel.frame)+10, 75, 20)];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:_timeLabel];
        
        _liuyanImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_timeLabel.frame)+5, CGRectGetMaxY(_titleLabel.frame)+10, 20, 20)];
        _liuyanImage.image = [UIImage imageNamed:@"hot1"];
        [self.contentView addSubview:_liuyanImage];
        
        _liuyanLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_liuyanImage.frame)+5, CGRectGetMaxY(_titleLabel.frame)+10, 20, 20)];
        _liuyanLabel.font = [UIFont boldSystemFontOfSize:13];
        _liuyanLabel.textColor = [UIColor blackColor];
        
        [self.contentView addSubview:_liuyanLabel];
        
        _liulanImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_liuyanLabel.frame)+10, CGRectGetMaxY(_titleLabel.frame)+10, 20, 20)];
        _liulanImage.image = [UIImage imageNamed:@"hot2"];
        [self.contentView addSubview:_liulanImage];
        
        _liulanLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_liulanImage.frame)+5, CGRectGetMaxY(_titleLabel.frame)+10, 30, 20)];
        _liulanLabel.font = [UIFont boldSystemFontOfSize:13];
        _liulanLabel.textColor = [UIColor blackColor];
        
        [self.contentView addSubview:_liulanLabel];
        
        _sanjiaoImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame), 33, 20, 20)];
        _sanjiaoImage.image = [UIImage imageNamed:@"未读"];
        [self.contentView addSubview:_sanjiaoImage];
    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

+(LuntanCell *)luntanCellWithTableView:(UITableView *)tableView{
    static NSString *ident = @"cell";
    
    LuntanCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        cell = [[LuntanCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}

-(void)setMyModel:(LuntanModel *)myModel{
    _myModel = myModel;
    

    _titleLabel.text = _myModel.subject;
    _nameLabel.text = _myModel.lastposter;
    _liuyanLabel.text = [NSString stringWithFormat:@"(%@)",_myModel.replies];
    _liulanLabel.text = [NSString stringWithFormat:@"(%@)",_myModel.views];
    _timeLabel.text = _myModel.date;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

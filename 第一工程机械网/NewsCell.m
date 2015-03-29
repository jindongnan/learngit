//
//  NewsCell.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
#import "UIKit+AFNetworking.h"

@implementation NewsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        if (_myModel.newsimg == nil) {
            _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 310, 20)];
            _nameLabel.text = _myModel.newstitle;
            _nameLabel.font = [UIFont boldSystemFontOfSize:18];
            _nameLabel.numberOfLines = 1;
            [self.contentView addSubview:_nameLabel];
            
            _neirongLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(_nameLabel.frame)+5, 310, 40)];
            _neirongLabel.text = _myModel.newsmemo;
            _neirongLabel.numberOfLines = 2;
            _neirongLabel.textColor = [UIColor grayColor];
            _neirongLabel.font = [UIFont systemFontOfSize:15];
            [self.contentView addSubview:_neirongLabel];
            
            _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(220, CGRectGetMaxY(_neirongLabel.frame)+2, 100, 13)];
            _timeLabel.text = _myModel.newstime;
            _timeLabel.font = [UIFont systemFontOfSize:12];
            _timeLabel.textColor = [UIColor grayColor];
            [self.contentView addSubview:_timeLabel];

        }else{
        _leftView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 80, 70)];
        _leftView.image = [UIImage imageNamed:_myModel.newsimg];
        
        [self.contentView addSubview:_leftView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftView.frame)+5, 2, 220, 10)];
        _nameLabel.text = _myModel.newstitle;
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        _nameLabel.numberOfLines = 1;
        [self.contentView addSubview:_nameLabel];
        
        _neirongLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftView.frame)+5, CGRectGetMaxY(_nameLabel.frame), 220, 20)];
        _neirongLabel.text = _myModel.newsmemo;
        _neirongLabel.numberOfLines = 2;
        _neirongLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_neirongLabel];
            
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(190,CGRectGetMaxY(_neirongLabel.frame), 100, 8)];
        _timeLabel.text = _myModel.newstime;
        _timeLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_timeLabel];
        }
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

+(NewsCell *)newsCellWithTableView:(UITableView *)tableView{
    static NSString *ident = @"cell";
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}

-(void)setMyModel:(NewsModel *)myModel{
    _myModel = myModel;
    
    [_leftView setImageWithURL:[NSURL URLWithString:myModel.newsimg]];
    _nameLabel.text = myModel.newstitle;
    
    _timeLabel.text = myModel.newstime;
    _neirongLabel.text = myModel.newsmemo;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  LTxiangqingViewController.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "LTxiangqingViewController.h"
#import "LuntanModel.h"

@interface LTxiangqingViewController ()

@end

@implementation LTxiangqingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"D1CM论坛";
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 74, 190, 20)];
    titleLabel.text = _LTxqModel.subject;
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:titleLabel];
    
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 104, 60, 15)];
    nameLabel.text = _LTxqModel.lastposter;
    nameLabel.textColor = [UIColor blueColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.view addSubview:nameLabel];
    
    UILabel * timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 104, 90, 15)];
    timeLabel.text = _LTxqModel.lastpostdate;
    timeLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.view addSubview:timeLabel];
    
    UILabel * shenfenLabel = [[UILabel alloc]initWithFrame:CGRectMake(270, 104, 30, 15)];
 
    shenfenLabel.text = @"楼主";
    shenfenLabel.font = [UIFont boldSystemFontOfSize:14];
    
    [self.view addSubview:shenfenLabel];
    
    UIImageView * background = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(nameLabel.frame)+10, 300, 100)];
    background.image = [UIImage imageNamed:@"tieziback.jpg"];
    [self.view addSubview:background];
    
    UILabel *neirong = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, 280, 10)];
    neirong.text = _LTxqModel.subject;
    [background addSubview:neirong];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

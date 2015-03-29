//
//  HuodongXiangqingViewController.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "HuodongXiangqingViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "HuodongModel.h"
#import "JDNButton.h"

@interface HuodongXiangqingViewController ()
@property(nonatomic,strong)HuodongXiangqingViewController *HDxqViewController;
@property(nonatomic,strong)NSMutableArray *HDxqDatas;

@property(nonatomic,strong)UIImageView *HDimageView;
@end

@implementation HuodongXiangqingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动详情";
    self.view.backgroundColor = [UIColor grayColor];
    _HDimageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 320, 130)];
    [_HDimageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", _HDxqModel.actimg]]];
    NSLog(@"%@",_HDxqModel.actimg);
    [self.view addSubview:_HDimageView];
    
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 194, 320, 40)];
    backImage.image = [UIImage imageNamed:@"img_top"];
    backImage.userInteractionEnabled = YES;
    [self.view addSubview:backImage];

    JDNButton *zuo = [JDNButton buttonWithFrame:CGRectMake(10, 5, 95, 30) type:UIButtonTypeCustom title:nil backgroundImage:nil image:nil andBlock:^(JDNButton *button) {
    
    }];
    zuo.highlighted = NO;
    [zuo setBackgroundImage:[UIImage imageNamed:@"huodong1" ] forState:UIControlStateNormal];
    [zuo setImage:[UIImage imageNamed:@"huodong2"] forState:UIControlStateSelected];
    zuo.selected = !zuo.selected;
    [backImage addSubview:zuo];
    
    JDNButton *zhong = [JDNButton buttonWithFrame:CGRectMake(105, 5, 100, 30) type:UIButtonTypeCustom title:nil backgroundImage:nil image:nil andBlock:^(JDNButton *button) {

    }];
    zhong.highlighted = NO;
    [zhong setBackgroundImage:[UIImage imageNamed:@"huodong4" ] forState:UIControlStateNormal];
    [zhong setImage:[UIImage imageNamed:@"huodong3"] forState:UIControlStateSelected];
    zhong.selected = !zhong.selected;
    [backImage addSubview:zhong];

    
    
    JDNButton *you = [JDNButton buttonWithFrame:CGRectMake(205, 5, 95, 30) type:UIButtonTypeCustom title:nil backgroundImage:nil image:nil andBlock:^(JDNButton *button) {
        
    }];
    you.highlighted = NO;
    [you setBackgroundImage:[UIImage imageNamed:@"huodong6" ] forState:UIControlStateNormal];
    [you setImage:[UIImage imageNamed:@"huodong5"] forState:UIControlStateSelected];
    you.selected = !you.selected;
    [backImage addSubview:you];
    
    UIImageView * textImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 240, 300, 180)];
    textImage.image = [UIImage imageNamed:@"账目背景"];
    [self.view addSubview:textImage];
    
    UILabel * biaoti = [[UILabel alloc]initWithFrame:CGRectMake(8, 10, 280, 15)];
    biaoti.text = [NSString stringWithFormat:@"活动标题: %@",_HDxqModel.acttitle];
    biaoti.font = [UIFont boldSystemFontOfSize:14];
    [textImage addSubview:biaoti];

    UILabel * renshu = [[UILabel alloc]initWithFrame:CGRectMake(8, CGRectGetMaxY(biaoti.frame), 280, 15)];
    renshu.text = [NSString stringWithFormat:@"参与人数: %@",_HDxqModel.actpeoplenum];
    renshu.font = [UIFont boldSystemFontOfSize:13];
    [textImage addSubview:renshu];
    
    UILabel * kaishi = [[UILabel alloc]initWithFrame:CGRectMake(8, CGRectGetMaxY(renshu.frame), 280, 15)];
    kaishi.text = [NSString stringWithFormat:@"开始时间: %@",_HDxqModel.actstarttime];
    kaishi.font = [UIFont boldSystemFontOfSize:13];
    [textImage addSubview:kaishi];
    
    UILabel * jieshu = [[UILabel alloc]initWithFrame:CGRectMake(8, CGRectGetMaxY(kaishi.frame), 280, 15)];
    jieshu.text = [NSString stringWithFormat:@"结束时间: %@",_HDxqModel.actendtime];
    jieshu.font = [UIFont boldSystemFontOfSize:13];
    [textImage addSubview:jieshu];
    
    UILabel * duixiang = [[UILabel alloc]initWithFrame:CGRectMake(8, CGRectGetMaxY(jieshu.frame), 280, 35)];
    duixiang.numberOfLines = 0;
    duixiang.text = [NSString stringWithFormat:@"参与对象: %@",_HDxqModel.acttopeople];
    duixiang.font = [UIFont boldSystemFontOfSize:13];
    [textImage addSubview:duixiang];
    
    UILabel * neirong = [[UILabel alloc]initWithFrame:CGRectMake(8, CGRectGetMaxY(duixiang.frame), 280, 70)];
    neirong.text = [NSString stringWithFormat:@"活动内容: %@",_HDxqModel.actmemo];
    neirong.numberOfLines = 0;
    neirong.font = [UIFont boldSystemFontOfSize:13];
    [textImage addSubview:neirong];
}

//-(void)downloadData{
//    NSString *path = @"http://api.d1cm.com/appact/myact.action?userid=1";
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    [manager POST:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"string:%@",string);
//        
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        
//        NSArray *array = dic[@"info"];
//        _HDxqDatas = [NSMutableArray array];
//        for (NSDictionary *dic in array) {
//            HDxiangqingModel *model = [HDxiangqingModel datasWithDic:dic];
//            [_HDxqDatas addObject:model];
//            
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"失败");
//    }];
//    
//}



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

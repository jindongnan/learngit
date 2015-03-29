//
//  ThirdViewController.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "ThirdViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "HuodongCell.h"
#import "HuodongModel.h"
#import "HuodongXiangqingViewController.h"
#import "HDxiangqingModel.h"

@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *HuodongView;
@property(nonatomic,strong)NSMutableArray *huodongDatas;
@end

@implementation ThirdViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"D1CM活动";
    
    //创建表
    _HuodongView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _HuodongView.delegate = self;
    _HuodongView.dataSource = self;
    
    [self.view addSubview:_HuodongView];
    [self downloadData];
    
    
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _huodongDatas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HuodongCell *cell = [HuodongCell huodongCellWithTableView:tableView];
    
    HuodongModel *model = _huodongDatas[indexPath.row];
    cell.myModel = model;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HuodongXiangqingViewController *xiangqing = [[HuodongXiangqingViewController alloc]init];
    xiangqing.HDxqModel = _huodongDatas[indexPath.row];
    [self.navigationController pushViewController:xiangqing animated:YES];
}

-(void)downloadData{
    NSString *path = @"http://api.d1cm.com/appact/hotact.action?page=1";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//                        NSLog(@"string:%@",string);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *array = dic[@"info"];
        _huodongDatas = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            HuodongModel *model = [HuodongModel huodongWithDic:dic];
            [_huodongDatas addObject:model];
            
        }
        [_HuodongView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
    
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

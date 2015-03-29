//
//  SecondViewController.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "SecondViewController.h"
#import "LuntanCell.h"
#import "LuntanModel.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "LTxiangqingViewController.h"

@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *luntanView;
@property(nonatomic,strong)NSMutableArray *luntanDatas;
@end

@implementation SecondViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"D1CM论坛";
    
    //创建表
    _luntanView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-40) style:UITableViewStylePlain];
    
    _luntanView.delegate = self;
    _luntanView.dataSource = self;
    
    [self.view addSubview:_luntanView];
    [self downloadData];

    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _luntanDatas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LuntanCell *cell = [LuntanCell luntanCellWithTableView:tableView];
    
    LuntanModel *model = _luntanDatas[indexPath.row];
    cell.myModel = model;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LTxiangqingViewController * LTxiangqing = [[LTxiangqingViewController alloc]init];
    LTxiangqing.LTxqModel = _luntanDatas[indexPath.row];
    [self.navigationController pushViewController:LTxiangqing animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

-(void)downloadData{
    NSString *path = @"http://api.d1cm.com/appbbs/getthreadlist.action";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:path parameters:@{@"fid":@"39"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"string:%@",string);

        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *array = dic[@"info"];
        _luntanDatas = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            LuntanModel *model = [LuntanModel modelWithDic:dic];
            [_luntanDatas addObject:model];
            
        }
        [_luntanView reloadData];

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

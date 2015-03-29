//
//  ViewController.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "ViewController.h"
#import "NewsCell.h"
#import "AFNetworking.h"
#import "NewsModel.h"
#import "ImagesModel.h"
#import "UIKit+AFNetworking.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *datas;
@property(nonatomic,strong)NSMutableArray *images;
@property(nonatomic,strong)UILabel *titLabel;
@property(nonatomic,strong)ImagesModel *model;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"热点新闻";
    
    //scrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 6, 150);
    _scrollView.pagingEnabled = YES;//可以翻页
    _scrollView.showsHorizontalScrollIndicator = NO;//去掉滚动条
    _scrollView.delegate = self;
    
    [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:NO];
    [self.view addSubview:_scrollView];

    
    
    //创建表
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrollView.frame), 320, self.view.frame.size.height-40) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    [self downloadData];
    [self downloadImages];
    // Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsCell *cell = [NewsCell newsCellWithTableView:tableView];
    
    NewsModel *model = _datas[indexPath.row];
    cell.myModel = model;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(void)downloadData{
    NSString *path = @"http://api.d1cm.com/appnews/daynews.action?page=1";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//                NSLog(@"string:%@",string);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *array = dic[@"info"];
        _datas = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            NewsModel *model = [NewsModel modeWithDic:dic];
            [_datas addObject:model];
            
        }
        [_tableView reloadData];
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
    
}
-(void)downloadImages{
    NSString *path = @"http://api.d1cm.com/appadv/advlist.action?advsiteid=10000";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"string:%@",string);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *array = dic[@"info"];
        _images = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            ImagesModel *model = [ImagesModel imageWithDic:dic];
            [_images addObject:model];
            
        }
        [self createNearByAppScrollView];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
    
}
-(void)createNearByAppScrollView{
    CGFloat w = self.view.frame.size.width;
    for (int i = 0; i < _images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*w, 0, w, 200)];
        ImagesModel *model = _images[i];
        
        [imageView setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        
        [_scrollView addSubview:imageView];
        
        
        //底部名字
        _titLabel = [[UILabel alloc]initWithFrame:CGRectMake(i*(w+10), CGRectGetMaxY(_scrollView.frame)-20, w, 20)];
        _titLabel.backgroundColor = [UIColor blackColor];
        _titLabel.alpha = 0.5;
        _titLabel.text = model.imgtitle;
        _titLabel.textColor = [UIColor whiteColor];
        _titLabel.font = [UIFont systemFontOfSize:15] ;
        [self.view addSubview:_titLabel];
        
    }
    _scrollView.contentSize = CGSizeMake(w*_images.count, 0);//滚动视图内容大小
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

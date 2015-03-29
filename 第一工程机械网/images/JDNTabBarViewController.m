//
//  JDNTabBarViewController.m
//  第一工程机械网
//
//  Created by DongnanJin on 15/3/16.
//  Copyright (c) 2015年 晋东南. All rights reserved.
//

#import "JDNTabBarViewController.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "RDVTabBarItem.h"
@interface JDNTabBarViewController ()

@end

@implementation JDNTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ViewController *xinwenVC = [[ViewController alloc] init];
    UINavigationController *xinwenNav = [[UINavigationController alloc] initWithRootViewController:xinwenVC];
    [xinwenNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navgationBar"] forBarMetrics:UIBarMetricsDefault];

    [xinwenVC release];
    
    
    SecondViewController *luntanVC = [[SecondViewController alloc] init];
    UINavigationController *luntanNav = [[UINavigationController alloc] initWithRootViewController:luntanVC];
    [luntanVC release];
    
    ThirdViewController *huodongVC = [[ThirdViewController alloc] init];
    UINavigationController *huodongNav = [[UINavigationController alloc] initWithRootViewController:huodongVC];
    [huodongVC release];
    
    FourthViewController *zhuliVC = [[FourthViewController alloc] init];
    UINavigationController *zhuliNav = [[UINavigationController alloc] initWithRootViewController:zhuliVC];
    [zhuliVC release];
    
    FifthViewController *setVC = [[FifthViewController alloc] init];
    UINavigationController *setNav = [[UINavigationController alloc] initWithRootViewController:setVC];
    [setVC release];
    
    [self setViewControllers:@[xinwenNav, luntanNav, huodongNav, zhuliNav, setNav]];
    [xinwenNav release];
    [luntanNav release];
    [huodongNav release];
    [zhuliNav release];
    [setNav release];
    
    NSArray *normalImages = @[@"新闻.png", @"论坛.png", @"活动.png", @"助理.png", @"设置.png"];
    NSArray *selectedImages = @[@"新闻2.png", @"论坛2.png", @"活动2.png", @"助理2.png", @"设置2.png"];
    
    RDVTabBar *tabBar = [[RDVTabBar alloc] init];
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 63)];
    
    
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        UIImage *normalImage = [UIImage imageNamed:[normalImages objectAtIndex:index]];
        UIImage *selectedImage = [UIImage imageNamed:[selectedImages objectAtIndex:index]];
        [item setBackgroundSelectedImage:selectedImage withUnselectedImage:normalImage];
        index++;
        
    }
    [tabBar release];
    [self customizeInterface];
    
    
}


- (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
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

//
//  BaseViewController.m
//  CustomTabBarController
//
//  Created by Alex on 16/3/14.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.navigationController.viewControllers.count > 1) {
        self.tabBarController.hidesBottomBarWhenPushed = YES;
    }
    else
    {
        self.tabBarController.hidesBottomBarWhenPushed = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCustomNavigationItem];
}

/**
 *  自定义返回按钮
 */
- (void)initCustomNavigationItem
{
    if (!self.navigationItem.leftBarButtonItem) {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"backBtn"] style:UIBarButtonItemStylePlain target:self action:@selector(onGoBack:)];
        leftItem.tintColor = [UIColor whiteColor];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
}

/**
 *  返回按钮点击事件
 *
 *  @param sender
 */
- (void)onGoBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  是否隐藏返回按钮
 *
 *  @param yesOrNo yesOrNo
 */
- (void)setBackButtonHidden:(BOOL)yesOrNo
{
    if (yesOrNo) {
        self.navigationItem.leftBarButtonItem = nil;
    }
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

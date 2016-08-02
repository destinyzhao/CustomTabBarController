//
//  CustomTabBarController.m
//  CustomTabBarController
//
//  Created by Alex on 16/3/14.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "CustomTabBarController.h"
#import "CustomTabBarItem.h"

@interface CustomTabBarController ()<UINavigationControllerDelegate>

@property (strong, nonatomic) NSMutableArray *tabbarItemArray;

@end

@implementation CustomTabBarController


+(instancetype)sharedTabBarController
{
    static CustomTabBarController *_tabBarController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_tabBarController == nil) {
            _tabBarController = [[CustomTabBarController alloc]init];
        }
    });
    return _tabBarController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tabbarItemArray = [NSMutableArray array];
    [self setUpTabbar];
    [self setUpTabbarItems];
    [self setupViewController];
    
    [self setBadgeValue:@"9" atIndex:0];
    [self setBadgeValue:@"990" atIndex:1];
    [self setBadgeValue:@"99" atIndex:3];
}

/**
 *  初始化Tabbar
 */
- (void)setUpTabbar
{
    __weak __typeof(&*self)weakSelf = self;
    
    _customTabBar = [[CustomTabBar alloc]initWithFrame:self.tabBar.bounds];
    _customTabBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_customTabBar];
    
    [_customTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.equalTo(@0);
        make.right.equalTo(@0);
        make.height.mas_equalTo(self.tabBar.frame.size.height);
    }];
    
    // Tabbar Item Selected
    _customTabBar.tabbarItemSelectBlock = ^(NSInteger selectIndex){
        weakSelf.selectedIndex = selectIndex;
    };
}

/**
 *  初始化Tabbar Item
 */
- (void)setUpTabbarItems
{
    [self tabBarItemWithTitle:@"首页" normalImageName:@"首页" highlightedImage:@"首页-1"];
    [self tabBarItemWithTitle:@"商超" normalImageName:@"应用" highlightedImage:@"应用-1"];
    [self tabBarItemWithTitle:@"商城" normalImageName:@"消息" highlightedImage:@"消息-1"];
    [self tabBarItemWithTitle:@"购物车" normalImageName:@"应用" highlightedImage:@"应用-1"];
    [self tabBarItemWithTitle:@"我的" normalImageName:@"我的" highlightedImage:@"我的-1"];
    _customTabBar.tabBarItemsArray = _tabbarItemArray;
}

/**
 *  初始化ViewControllers
 */
- (void)setupViewController
{
    NSArray *storyBoardArray = @[@"Storyboard1",@"Storyboard2",@"Storyboard3",@"Storyboard4",@"Storyboard5"];
    NSMutableArray *viewControllerArray = [NSMutableArray array];
    for (NSString *sbName in storyBoardArray) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:sbName bundle:nil];
        UINavigationController *viewController = (UINavigationController *)[storyBoard instantiateInitialViewController];
        [viewControllerArray addObject:viewController];
    }
    
    self.viewControllers = viewControllerArray;
    
    // 设置默认选中的 Tabbar Item
     _customTabBar.tabBarSelectedIndex = 0;
}

/**
 *  初始化Tabbar Item
 *
 *  @param title            标题
 *  @param normalImageName  默认图片
 *  @param highlightedImage 高亮图片
 */
- (void)tabBarItemWithTitle:(NSString *)title normalImageName:(NSString *)normalImageName highlightedImage:(NSString *)highlightedImage
{
    CustomTabBarItem *item = [[CustomTabBarItem alloc]init];
    item.title = title;
    item.itemNormalImage = [UIImage imageNamed:normalImageName];
    item.itemHighlightedImage = [UIImage imageNamed:highlightedImage];
    [_tabbarItemArray addObject:item];
}

/**
 *  设置Item的Badge
 *
 *  @param badgeValue Badge
 *  @param atIndex    Tabbar Item Index
 */
- (void)setBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)atIndex
{
    CustomTabBarItem *item = [_tabbarItemArray objectAtIndex:atIndex];
    item.badgeValue = badgeValue;
}

-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed{
    self.tabBar.hidden = hidesBottomBarWhenPushed;
    self.customTabBar.hidden = hidesBottomBarWhenPushed;
}

/**
 *  显示和隐藏Tabbar
 *
 *  @param
 */
- (void)setTabBarHidden
{
    [self tabBarHidden:YES];
    // 显示Tabbar
    [_customTabBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.tabBar.frame.size.height);
    }];
}

- (void)setTabBarShow
{
    [self.view layoutIfNeeded];
    
    [self tabBarHidden:NO];
    // 显示Tabbar
    [_customTabBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
    }];
}

- (void)tabBarHidden:(BOOL)hidden
{
    [self.tabBar setHidden:hidden];
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

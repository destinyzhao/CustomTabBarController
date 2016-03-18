//
//  CustomTabBarController.h
//  CustomTabBarController
//
//  Created by Alex on 16/3/14.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBar.h"

@interface CustomTabBarController : UITabBarController

/**
 *  自定义Tabbar
 */
@property (strong, nonatomic) CustomTabBar *customTabBar;

/**
 *  单例
 *
 *  @return 单例
 */
+(instancetype)sharedTabBarController;

/**
 *  显示和隐藏Tabbar
 *
 *  @param viewControllersCount  viewControllers Count
 */
- (void)animationShowOrHideTabBar:(NSInteger)viewControllersCount;

/**
 *  设置Item的Badge
 *
 *  @param badgeValue Badge
 *  @param atIndex    Tabbar Item Index
 */
- (void)setBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)atIndex;

@end

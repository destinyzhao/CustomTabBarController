//
//  CustomTabBar.h
//  CustomTabBarController
//
//  Created by Alex on 16/3/14.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TabbarItemSelectBlcok)(NSInteger selectIndex);

@interface CustomTabBar : UIView

/**
 *  点击按钮Block回调
 */
@property (copy, nonatomic) TabbarItemSelectBlcok tabbarItemSelectBlock;
/**
 *  Tabbar Controller Selected Index
 */
@property (assign, nonatomic) NSInteger tabBarSelectedIndex;
/**
 *  记录Tabbar Item
 */
@property (strong, nonatomic) NSMutableArray *tabBarItemsArray;

@end

//
//  CustomTabBarItem.h
//  CustomTabBarController
//
//  Created by Alex on 16/3/14.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarItem : UIView
/**
 *  Tabbar Item 按钮
 */
@property (strong, nonatomic) UIButton *tabBarItemBtn;
/**
 *  Tabbar Item 默认图片
 */
@property (strong, nonatomic) UIImage *itemNormalImage;
/**
 *  Tabbar Item 高亮图片
 */
@property (strong, nonatomic) UIImage *itemHighlightedImage;
/**
 *  Tabbar Item 标题
 */
@property (strong, nonatomic) NSString *title;
/**
 *  Tabbar Item 标题颜色
 */
@property (strong, nonatomic) UIColor *titleColor;
/**
 *  Tabbar Item imageView 是否高亮
 */
@property (assign, nonatomic) BOOL itemHighlighted;

@end

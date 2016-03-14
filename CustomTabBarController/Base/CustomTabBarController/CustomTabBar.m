//
//  CustomTabBar.m
//  CustomTabBarController
//
//  Created by Alex on 16/3/14.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomTabBarItem.h"

#define TABBAR_HEIGHT self.frame.size.height
#define TABBAR_WIDTH  self.frame.size.width/4

@interface CustomTabBar ()

@end

@implementation CustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
    }
    return self;
}

/**
 *  设置Tabbar Items
 *
 *  @param tabBarItemsArray Tabbar Items
 */
- (void)setTabBarItemsArray:(NSMutableArray *)tabBarItemsArray
{
    _tabBarItemsArray = tabBarItemsArray;
    for (NSInteger i = 0; i < tabBarItemsArray.count; i++) {
        CustomTabBarItem *item = [tabBarItemsArray objectAtIndex:i];
        item.tabBarItemBtn.tag = i;
        [item.tabBarItemBtn addTarget:self action:@selector(tabbatItemBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:item];
        
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(i*TABBAR_WIDTH);
            make.width.mas_equalTo(TABBAR_WIDTH);
            make.height.mas_equalTo(TABBAR_HEIGHT);
            
        }];
    }

}

/**
 *  设置模式选中的ViewController
 *
 *  @param tabBarSelectedIndex slelectIndex
 */
- (void)setTabBarSelectedIndex:(NSInteger)tabBarSelectedIndex
{
    // 取默认的Tabbar Item
    CustomTabBarItem  *item = [_tabBarItemsArray objectAtIndex:tabBarSelectedIndex];
    [self tabbatItemBtnClicked: item.tabBarItemBtn];
}

/**
 *  按钮选中事件
 *
 *  @param sender sender
 */
- (void)tabbatItemBtnClicked:(UIButton *)sender
{
    // 取Tag
    NSInteger selectIndex = sender.tag;
    _tabbarItemSelectBlock(selectIndex);
    
    for (NSInteger i = 0; i < _tabBarItemsArray.count; i++) {
        CustomTabBarItem *item = [_tabBarItemsArray objectAtIndex:i];
        // 重新设置Tabbar Item 标题颜色
        item.titleColor = [UIColor blackColor];
        // Tabbar Item ImageView 高亮取消
        item.itemHighlighted = NO;
    }
    
    // 取当前TabbarItem
    CustomTabBarItem *item = [_tabBarItemsArray objectAtIndex:selectIndex];
    // 当前 Title 文字颜色
    item.titleColor = [UIColor blueColor];
    // 当前ImageView 高亮
    item.itemHighlighted = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

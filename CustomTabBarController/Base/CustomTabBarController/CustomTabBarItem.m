//
//  CustomTabBarItem.m
//  CustomTabBarController
//
//  Created by Alex on 16/3/14.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "CustomTabBarItem.h"

@interface CustomTabBarItem ()

/**
 *  Tabbar Item 图片
 */
@property (strong, nonatomic) UIImageView *tabBarItemImageView;
/**
 *  Tabbar Item Title Label
 */
@property (strong, nonatomic) UILabel *tabBarItemTxtLbl;

@end

@implementation CustomTabBarItem

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self setUpTabbarItem];
    }
    return self;
}

/**
 *  初始化 Tabbar Item
 */
- (void)setUpTabbarItem
{
    // Tabbar Item ImageView
    _tabBarItemImageView = [UIImageView new];
    _tabBarItemImageView.backgroundColor = [UIColor clearColor];
    _tabBarItemImageView.image = self.itemNormalImage;
    _tabBarItemImageView.highlightedImage = self.itemHighlightedImage;
    [self addSubview:_tabBarItemImageView];
    
    // Tabbar Item Text Label
    _tabBarItemTxtLbl = [UILabel new];
    _tabBarItemTxtLbl.backgroundColor = [UIColor clearColor];
    _tabBarItemTxtLbl.textAlignment = NSTextAlignmentCenter;
    _tabBarItemTxtLbl.font = [UIFont systemFontOfSize:11.f];
    [self addSubview:_tabBarItemTxtLbl];
    
    // Tabbar Item Button
    _tabBarItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _tabBarItemBtn.backgroundColor = [UIColor clearColor];
    [self addSubview:_tabBarItemBtn];
}

/**
 *  更新Constraints
 */
- (void)updateItemConstraints
{
    [_tabBarItemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.top.mas_equalTo(5);
        make.centerX.equalTo(self);
    }];
    
    [_tabBarItemTxtLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-1);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(20);
    }];
    
    [_tabBarItemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
}

/**
 *  设置标题
 *
 *  @param title 标题
 */
- (void)setTitle:(NSString *)title
{
    _tabBarItemTxtLbl.text = title;
}

/**
 *  设置默认图片
 *
 *  @param itemNormalImage 默认图片
 */
- (void)setItemNormalImage:(UIImage *)itemNormalImage
{
    _tabBarItemImageView.image = itemNormalImage;
}

/**
 *  设置高亮图片
 *
 *  @param itemHighlightedImage 高亮图片
 */
- (void)setItemHighlightedImage:(UIImage *)itemHighlightedImage
{
    _tabBarItemImageView.highlightedImage = itemHighlightedImage;
}

/**
 *  设置标题文字颜色
 *
 *  @param titleColor 文字颜色
 */
- (void)setTitleColor:(UIColor *)titleColor
{
    _tabBarItemTxtLbl.textColor = titleColor;
}

/**
 *  图片是否高亮
 *
 *  @param itemHighlighted Bool
 */
- (void)setItemHighlighted:(BOOL)itemHighlighted
{
    _tabBarItemImageView.highlighted = itemHighlighted;
}

/**
 *  更新约束
 */
- (void)layoutSubviews
{
    [self layoutIfNeeded];
    [self updateItemConstraints];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

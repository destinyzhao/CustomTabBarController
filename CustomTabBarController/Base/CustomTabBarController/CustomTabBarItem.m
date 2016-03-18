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
/**
 *  badge View
 */
@property (strong, nonatomic) UIImageView *tabBarItemBadgeView;
/**
 *  badge Label
 */
@property (strong, nonatomic) UILabel *tabBarItemBadgeLbl;


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
    
    // Badge View
    _tabBarItemBadgeView = [UIImageView new];
    _tabBarItemBadgeView.backgroundColor = [UIColor redColor];
    _tabBarItemBadgeView.layer.borderWidth = 1;
    _tabBarItemBadgeView.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:_tabBarItemBadgeView];
    // 默认隐藏
    _tabBarItemBadgeView.hidden = YES;
    
    // Badge Label
    _tabBarItemBadgeLbl = [UILabel new];
    _tabBarItemBadgeLbl.textColor = [UIColor whiteColor];
    _tabBarItemBadgeLbl.textAlignment = NSTextAlignmentCenter;
    _tabBarItemBadgeLbl.font = [UIFont systemFontOfSize:11.];
    [_tabBarItemBadgeView addSubview:_tabBarItemBadgeLbl];
    
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
    // Item ImageView
    [_tabBarItemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.top.mas_equalTo(8);
        make.centerX.equalTo(self);
    }];
    
    // Item TextLabel
    [_tabBarItemTxtLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-1);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(20);
    }];
    
    // Item BadgeView
    [_tabBarItemBadgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(2);
        make.left.equalTo(_tabBarItemImageView.mas_right).offset(-6);
    }];
    
    // Item BadgeLabel
    [_tabBarItemBadgeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_tabBarItemBadgeView);
    }];
    
    // Item Button
    [_tabBarItemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
}

/**
 *  更新约束
 */
- (void)layoutSubviews
{
    [self layoutIfNeeded];
    [self updateItemConstraints];
    
    _tabBarItemBadgeView.layer.masksToBounds = YES;
    _tabBarItemBadgeView.layer.cornerRadius = _tabBarItemBadgeView.frame.size.height/2;
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
 *  设置消息红点
 *
 *  @param badgeValue badgeValue
 */
- (void)setBadgeValue:(NSString *)badgeValue
{
    NSInteger bage = [badgeValue integerValue];
    
    if (bage > 0) {
        _tabBarItemBadgeView.hidden = NO;
        _tabBarItemBadgeLbl.text = badgeValue;
        
        [self updateBagdeConstraintWithBadgeValue:badgeValue];
    }
    else
    {
        _tabBarItemBadgeView.hidden = YES;
    }
}

/**
 *  根据Badge位数 更新Constraint
 *
 *  @param badgeValue
 */
- (void)updateBagdeConstraintWithBadgeValue:(NSString *)badgeValue
{
    if (badgeValue.length > 2) {
        [self updateBadgeViewConstraintsWith:30 height:20];
    }
    else
    {
        [self updateBadgeViewConstraintsWith:20 height:20];
    }
}

/**
 *  更新Badge Constraint
 *
 *  @param width  width
 *  @param height height
 */
- (void)updateBadgeViewConstraintsWith:(CGFloat)width height:(CGFloat)height
{
    [_tabBarItemBadgeView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo (width);
        make.height.mas_equalTo (height);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  NormalNavView.m
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import "NormalNavView.h"
#define BackButtonWidth  60 //返回按钮默认展示极小宽度是 60

@interface NormalNavView ()

@property (nonatomic, assign) CGFloat statusBarHeight;

@end

@implementation NormalNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}

#pragma mark - private

- (void)configSubviews
{
    [self addSubview:self.backButton];
    [self addSubview:self.smallTitleLabel];
    [self addSubview:self.rightMenuView];
    
    self.statusBarHeight = statusBar_height;
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(7);
        make.top.equalTo(self).offset(self.statusBarHeight);
        make.width.greaterThanOrEqualTo(@(BackButtonWidth));
        make.height.equalTo(@(44));
    }];
    
    [self.smallTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backButton);
        make.left.equalTo(self.backButton.mas_right);
        make.centerX.equalTo(self);
    }];
    
    [self.rightMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backButton);
        make.width.greaterThanOrEqualTo(@(BackButtonWidth));
        make.height.equalTo(@(44));
        make.left.greaterThanOrEqualTo(self.smallTitleLabel.mas_right);
        make.right.equalTo(self);
    }];
}

#pragma mark -  设置导航只有返回箭头 没文字 也没有右边导航按钮

- (void)updateSubviewsWithoutAnyButtonTitles
{
    [self.backButton setTitle:@"" forState:UIControlStateNormal];
    
    CGFloat buttonWidth = 20;
    [self.backButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(@(buttonWidth));
    }];
    
    [self.rightMenuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(@(buttonWidth));
    }];
}

#pragma mark - 更新状态

- (void)setNavViewAlpha:(CGFloat)alpha
{
    self.smallTitleLabel.alpha = alpha;
}

#pragma mark - getter and setter

- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
        UIColor *color = [UIColor orangeColor];
        [_backButton setTintColor:color];
        [_backButton setTitleColor:color forState:UIControlStateNormal];
        [_backButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
        [_backButton setImage:[UIImage imageNamed:@"icon_btn_back"] forState:UIControlStateNormal];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//左右方向，居左对齐
        _backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
    }
    return _backButton;
}

- (UILabel *)smallTitleLabel
{
    if (!_smallTitleLabel) {
        _smallTitleLabel = [UILabel new];
        _smallTitleLabel.font = [UIFont boldSystemFontOfSize:16];
        _smallTitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }
    return _smallTitleLabel;
}

- (UIView *)rightMenuView
{
    if (!_rightMenuView) {
        _rightMenuView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _rightMenuView;
}

@end

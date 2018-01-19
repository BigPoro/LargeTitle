//
//  DynamicNavView.m
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import "DynamicNavView.h"


@interface DynamicNavView ()

@property (nonatomic, assign) CGFloat defaultBackButtonTitleWidth;
@property (nonatomic, assign) CGFloat statusBarHeight;
@property (nonatomic, assign) CGFloat navViewTotalHeight;
@property (nonatomic, assign) CGFloat bigTitleViewHeight;

@end

@implementation DynamicNavView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //返回按钮文字过长被压缩 到极小宽度 显示默认返回文案
    if (self.navView.backButton.hf_width == 60) {
        NSString *defaultBackTitle = @"返回";
        CGSize titleSize = [self sizeWithText:self.backButtonTitle withFont:[UIFont systemFontOfSize:16]];
        if (titleSize.width > self.defaultBackButtonTitleWidth) {
            self.backButtonTitle = defaultBackTitle;
        }
    }
}

#pragma mark - private

- (void)configSubviews
{
    self.statusBarHeight = statusBar_height;
    self.navViewTotalHeight = statusBar_height + nav_normal_height + nav_expand_height;//(导航条 44 底部导航拓展部分 52)
    self.bigTitleViewHeight = nav_expand_height - 1;
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.navView];
    [self insertSubview:self.bigTitleView belowSubview:self.navView];
    
    CGSize titleSize = [self sizeWithText:@"返回" withFont:[UIFont systemFontOfSize:16]];
    self.defaultBackButtonTitleWidth = titleSize.width;
}

#pragma mark -- 计算单行宽度

- (CGSize)sizeWithText:(NSString *)text withFont:(UIFont *)font {
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}

#pragma mark - 实例方法

- (void)handleDefaultNormalNavigationBar
{
    [self dynamicNavViewAnimationWithYoffset:100];// 只要yOffset 大于等于51 就是默认高度(20 + 44) 100这里当极大值用
}

- (void)dynamicNavViewAnimationWithYoffset:(CGFloat)yOffset
{
    CGFloat headViewNormalHeight = self.statusBarHeight + nav_normal_height;
    CGFloat smallTitleAlpha = 0;
    CGFloat bigTitleTop = self.navViewTotalHeight - self.bigTitleViewHeight;
    if (yOffset > 0) { //折叠。。。
        if (yOffset < self.bigTitleViewHeight - 10) {
            bigTitleTop = self.navViewTotalHeight - (self.bigTitleViewHeight - 1) - yOffset;
//            if (yOffset > self.bigTitleViewHeight - self.statusBarHeight) {
//                NSLog(@"偏移值%f",yOffset);
//                smallTitleAlpha = 1;
//            }
        } else {
            bigTitleTop = headViewNormalHeight - (self.bigTitleViewHeight - 1);
            smallTitleAlpha = 1;
        }
    } else {
        bigTitleTop -= yOffset;
    }
    [self.navView setNavViewAlpha:smallTitleAlpha];
    self.bigTitleView.hf_orgY = bigTitleTop;
    self.hf_height = bigTitleTop + self.bigTitleViewHeight;
}

#pragma mark - getter and setter

- (NormalNavView *)navView
{
    if (!_navView) {
        _navView = [[NormalNavView alloc]initWithFrame:CGRectMake(0, 0, self.hf_width, self.statusBarHeight + nav_normal_height)];
        [_navView.backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_navView setBackgroundColor:[UIColor whiteColor]];
    }
    return _navView;
}

- (DynamicBigTitleView *)bigTitleView
{
    if (!_bigTitleView) {
        _bigTitleView = [[DynamicBigTitleView alloc]initWithFrame:CGRectMake(0, self.navView.hf_bottom, self.hf_width, self.bigTitleViewHeight)];
    }
    return _bigTitleView;
}

- (CGFloat)dynamicBottom
{
    return self.bigTitleView.hf_orgY;
}

- (NSString *)backButtonTitle
{
    return self.navView.backButton.titleLabel.text;
}

- (void)setBackButtonTitle:(NSString *)backButtonTitle
{
    if (!backButtonTitle) {
        backButtonTitle = @"";
    }
    [self.navView.backButton setTitle:backButtonTitle forState:UIControlStateNormal];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.navView.smallTitleLabel.text = title;
    self.bigTitleView.bigTitle = title;
}
- (void)setTitleRightView:(UIView *)titleRightView{
    _titleRightView = titleRightView;
    self.bigTitleView.rightView = titleRightView;
}

- (void)setDetaileTitle:(NSString *)detaileTitle{
    _detaileTitle = detaileTitle;
    self.bigTitleView.detailTitle = detaileTitle;
}
@end

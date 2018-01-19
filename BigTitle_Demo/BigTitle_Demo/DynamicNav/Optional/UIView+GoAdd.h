//
//  UIView+GoAdd.h
//  dailylife
//
//  Created by gorry on 2016/11/21.
//  Copyright © 2016年 huofar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GoAdd)

#pragma mark - add method

/**
 快速设置view的 shadowColor offset radius

 @param color  shadow color
 @param offset shadow offset
 @param radius radius
 */
- (void)setLayerShadow:(UIColor*)color
                offset:(CGSize)offset
                radius:(CGFloat)radius;

- (void)removeAllSubviews;

/**
 使用事件响应事件链的原理寻找view最近的viewController, 没有hui
 */
@property (nonatomic, readonly) UIViewController *viewController;

/**
 获取当天view对应的Xib view

 @return self view
 */
+ (UIView *)viewFromNib;


/**
 判断当前视图控制器是否可见

 @param viewController 当前视图控制器
 @return YES/NO
 */
+ (BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController;

#pragma mark - UIViewGeometry

@property (nonatomic) CGFloat hf_orgX;
@property (nonatomic) CGFloat hf_orgY;
@property (nonatomic) CGFloat hf_width;
@property (nonatomic) CGFloat hf_height;
@property (nonatomic) CGSize hf_size;
@property (nonatomic) CGPoint hf_origin;

@property (nonatomic) CGFloat hf_centerX;
@property (nonatomic) CGFloat hf_centerY;

@property (nonatomic,readonly) CGFloat hf_bottom;
@property (nonatomic,readonly) CGFloat hf_right;

@end

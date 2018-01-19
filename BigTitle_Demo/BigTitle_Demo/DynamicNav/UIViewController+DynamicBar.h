//
//  UIViewController+DynamicBar.h
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicNavView.h"

@interface UIViewController (DynamicBar)

@property (nonatomic, strong) DynamicNavView *dynamicNavView;

/**
 设置 展示导航大标题样式 UI
 */
- (void)defaultShowDynamicNav;

/**
 展示滚动 导航折叠Animation  就在滚动代理方法 UIScrollViewDelegate 中实现该方法
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView

 @param scrollView scrollView
 */
- (void)showDynamicBarAnimationWithScrollView:(UIScrollView *)scrollView;

@end

//
//  DynamicNavView.h
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalNavView.h"
#import "DynamicBigTitleView.h"

@interface DynamicNavView : UIView

@property (nonatomic, strong) NormalNavView *navView;
@property (nonatomic, strong) DynamicBigTitleView *bigTitleView;
@property (nonatomic, strong) NSString *title; //设置导航标题
@property (nonatomic, strong) NSString *backButtonTitle;//设置导航返回名称
@property (nonatomic, assign) CGFloat  lastYoffset;
@property (nonatomic, assign,readonly) CGFloat  dynamicBottom; //跟踪大标题底部位置变化 是视图控制器中其他Ui的起始高度
@property (nonatomic, strong) UIView *titleRightView;
@property (nonatomic, copy) NSString *detaileTitle;
/**
 可以手动设置使用默认 通用正常导航
 */
- (void)handleDefaultNormalNavigationBar;

/**
 在滚代理方法里面获取偏移量
 根据变化偏移量设置导航UI效果animation
 
 @param yOffset 变化偏移量
 */
- (void)dynamicNavViewAnimationWithYoffset:(CGFloat)yOffset;


@end

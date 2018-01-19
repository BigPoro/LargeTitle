//
//  HFNormalNavView.h
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalNavView : UIView

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIView *rightMenuView;
@property (nonatomic, strong) UILabel  *smallTitleLabel;


/**
 设置导航标题展示效果

 @param alpha 透明度
 */
- (void)setNavViewAlpha:(CGFloat)alpha;

/**
 设置导航只有返回箭头 没文字 也没有右边导航按钮 充分展示导航标题文字
 这种类似方法 完全根据需求定制 同理更新或者修改约束即可
 暴露的属性都是可读写的，任何需要的地方可直接扩展
 注意要点：标题居中，约束合法
 */
- (void)updateSubviewsWithoutAnyButtonTitles;

@end

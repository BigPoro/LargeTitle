//
//  DynamicBigTitleView.h
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicBigTitleView : UIView

@property (nonatomic, copy) NSString *bigTitle;
@property (nonatomic, copy) NSString *detailTitle;
@property (nonatomic, strong) UIView *rightView;
@end

//
//  SecondViewController.m
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+DynamicBar.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我是自定义普通导航导航";
    self.view.backgroundColor = [UIColor whiteColor];
    [self defaultShowDynamicNav];////导航大标题展示
    [self.dynamicNavView handleDefaultNormalNavigationBar];//设置customNormalNav
    //TODO: 起始高度  从self.dynamicNavView.dynamicBottom 开始 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

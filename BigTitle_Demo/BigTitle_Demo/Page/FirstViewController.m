//
//  FirstViewController.m
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import "FirstViewController.h"
#import "UIViewController+DynamicBar.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我是标题";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self defaultShowDynamicNav];////导航大标题展示
    //TODO: 起始高度  从self.dynamicNavView.dynamicBottom + self.dynamicNavView.bigTitleView.hf_height 开始
    // 如果 滚动 起始位置 还是 self.dynamicNavView.dynamicBottom 参照 ViewController 和 FourViewController 写法
    UIView *v = [[UIView alloc]init];
    v.backgroundColor = [UIColor orangeColor];
    self.dynamicNavView.navView.rightMenuView = v;
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

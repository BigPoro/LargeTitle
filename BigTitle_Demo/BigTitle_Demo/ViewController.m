//
//  ViewController.m
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/15.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+DynamicBar.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.clipsToBounds = YES;
    self.title = @"这是个大标题";
    
    UISwitch *s = [[UISwitch alloc]init];
    self.dynamicNavView.titleRightView = s;
    self.dynamicNavView.detaileTitle = @"这是个小标题";
    [self defaultShowDynamicNav];//导航大标题展示  【1】放在tableView 的上层
    
    tableView = [[UITableView alloc]init];
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    [self.view addSubview:self.dynamicNavView];
    [self.dynamicNavView.navView.backButton setHidden:YES]; // 一级页面 隐藏返回按钮
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(self.dynamicNavView.dynamicBottom));/////修改起始高度 【2】这个起始位置相对还是64
        make.left.right.bottom.equalTo(self.view);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.contentInset = UIEdgeInsetsMake(self.dynamicNavView.bigTitleView.hf_height, 0, 0, 0);////这行代码必须有 【3】为了连贯联动效果
    [tableView setContentOffset:CGPointMake(self.view.hf_width, - self.dynamicNavView.bigTitleView.hf_height) animated:NO];////这行代码必须有 【4】为了连贯联动效果
    [tableView reloadData];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSInteger row =  indexPath.row;
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    if (row == 0) {
        cell.textLabel.text = @"不可滚动大标题";
    }
    if (row == 1) {
        cell.textLabel.text = @"custom普通导航";
    }
    if (row == 2) {
        cell.textLabel.text = @"可滚带返回按钮大标题";
    }
    if (row == 3) {
        cell.textLabel.text = @"systom普通导航";
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row =  indexPath.row;
    if (row == 0) {
        
        FirstViewController *vc = [[FirstViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (row == 1) {
        SecondViewController *vc = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (row == 2) {
        FourViewController *vc = [[FourViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (row == 3) {
        ThirdViewController *vc = [[ThirdViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //下面代码选择实现 需要导航折叠Animation 就要在该代理方法里面实现 不滚动就是默认大标题 【5】选择性实现
    [self showDynamicBarAnimationWithScrollView:scrollView];
    ///
}
@end

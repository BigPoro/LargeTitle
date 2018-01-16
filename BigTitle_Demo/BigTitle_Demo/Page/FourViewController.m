//
//  FourViewController.m
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import "FourViewController.h"
#import "UIViewController+DynamicBar.h"

@interface FourViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
}

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"这也是个大标题";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.clipsToBounds = YES;
    
    
    tableView = [[UITableView alloc]init];
    [self.view addSubview:tableView];
    [self defaultShowDynamicNav];//导航大标题展示  【1】放在tableView 的上层
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(self.dynamicNavView.dynamicBottom));/////修改起始高度 【2】这个起始位置相对还是64
        make.left.right.bottom.equalTo(self.view);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.contentInset = UIEdgeInsetsMake(self.dynamicNavView.bigTitleView.frame.size.height, 0, 0, 0);////这行代码必须有 【3】为了连贯联动效果
    [tableView setContentOffset:CGPointMake(self.view.frame.size.width, - self.dynamicNavView.bigTitleView.frame.size.height) animated:NO];////这行代码必须有 【4】为了连贯联动效果
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //下面代码选择实现 需要导航折叠Animation 就要在该代理方法里面实现 不滚动就是默认大标题 【5】选择性实现
    ////
    [self showDynamicBarAnimationWithScrollView:scrollView];
    ///
}


@end

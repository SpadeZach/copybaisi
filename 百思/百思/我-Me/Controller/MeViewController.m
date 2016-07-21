//
//  MeViewController.m
//  百思
//
//  Created by 赵博 on 16/7/14.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "MeViewController.h"
#import "SettingViewController.h"
#import "MeCell.h"
#import "MeFooterView.h"
@interface MeViewController ()

@end

@implementation MeViewController
- (instancetype)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.backgroundColor = CommonBgColor;
    
    [self setupNav];
    
    [self setupTableView];
}

- (void)setupNav{
    //标题（不建议直接使用self.title）
    self.navigationItem.title = @"我的";
    //右边-设置
    UIBarButtonItem *settingItem =[UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    //右边- 月亮
    UIBarButtonItem *moonButtonItem = [UIBarButtonItem  itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[ settingItem, moonButtonItem];
}

- (void)setupTableView{
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = CustomMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(CustomMargin- 25, 0, 0, 0);
    //设置tableView
    MeFooterView *footerView = [[MeFooterView alloc] init];
    self.tableView.tableFooterView = footerView;
}
- (void)settingClick{
    SettingViewController *tempVC = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:tempVC animated:YES];
}
- (void)moonClick{
    
}
#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //确定重用标识
    static NSString *cellIdentify = @"Identify";
    //从缓存池中取
    MeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        //如果空手动创建
        cell = [[MeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    //设置数据
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    }else{
        cell.textLabel.text = @"离线下载";
        //不设置nil 如果重复利用 会有图片，所以清空
        cell.imageView.image = nil;
    }
    return cell;
    
}

#pragma mark - 点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end

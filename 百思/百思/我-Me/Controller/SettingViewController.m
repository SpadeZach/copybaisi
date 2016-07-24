//
//  SettingViewController.m
//  百思
//
//  Created by 赵博 on 16/7/15.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "SettingViewController.h"
#import "ClearCacheTableViewCell.h"

@interface SettingViewController ()

@end

@implementation SettingViewController
static NSString *const ClearCacheCellId = @"clearCacheIdentify";
- (instancetype)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CommonBgColor;
    self.navigationItem.title = @"设置";
    [self setupTableView];
    //注册
    [self.tableView registerClass:[ClearCacheTableViewCell class] forCellReuseIdentifier:ClearCacheCellId];
    
}

- (void)setupTableView{
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = CustomMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(CustomMargin - 25, 0, 0, 0);
}
#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出cell
    ClearCacheTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ClearCacheCellId];
    
    
    return cell;
}

#pragma mark - 点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

@end

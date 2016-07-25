//
//  SettingViewController.m
//  百思
//
//  Created by 赵博 on 16/7/15.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "SettingViewController.h"
#import "ClearCacheTableViewCell.h"
#import "SettingCell.h"
@interface SettingViewController ()

@end

@implementation SettingViewController
static NSString *const ClearCacheCellId = @"clearCacheIdentify";
static NSString *const SettingCellId = @"settingIdentify";
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
    [self.tableView registerClass:[SettingCell class] forCellReuseIdentifier:SettingCellId];
    
}

- (void)setupTableView{
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = CustomMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(CustomMargin - 25, 0, 0, 0);
}
#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        //取出cell
        return [tableView dequeueReusableCellWithIdentifier:ClearCacheCellId];
    }else{
        SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:SettingCellId];
        
        if (indexPath.row == 1) {
            cell.textLabel.text = @"意见反馈";
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"给我们评分";
        }else if (indexPath.row == 3){
            cell.textLabel.text = @"推送设置";
        }else{
             cell.textLabel.text = @"关于我们";
        }
        
        return cell;
    }
}

#pragma mark - 点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

@end

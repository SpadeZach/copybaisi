//
//  MeViewController.m
//  百思
//
//  Created by 赵博 on 16/7/14.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "MeViewController.h"
#import "SettingViewController.h"
@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CommonBgColor;
    //标题（不建议直接使用self.title）
    self.navigationItem.title = @"我的";
    //右边-设置
    UIBarButtonItem *settingItem =[UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    //右边- 月亮
    UIBarButtonItem *moonButtonItem = [UIBarButtonItem  itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[ settingItem, moonButtonItem];
}


- (void)settingClick{
    SettingViewController *tempVC = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:tempVC animated:YES];
}
- (void)moonClick{
    
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

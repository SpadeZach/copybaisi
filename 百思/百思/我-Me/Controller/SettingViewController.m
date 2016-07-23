//
//  SettingViewController.m
//  百思
//
//  Created by 赵博 on 16/7/15.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "SettingViewController.h"
#import <SDImageCache.h>
@interface SettingViewController ()

@end

@implementation SettingViewController
- (instancetype)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CommonBgColor;
    self.navigationItem.title = @"设置";
    [self setupTableView];
    //获取缓存大小
    [self getCacheSize];
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
    //确定重用标识
    static NSString *cellIdentify = @"setup";
    //从缓存池中取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        //如果空手动创建
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    //框架下 获取图片大小
//    [SDImageCache sharedImageCache].getSize;
    cell.textLabel.text = @"清除缓存";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //沙盒路径
//    CustomLog(@"%@",NSHomeDirectory());
    return cell;
}

#pragma mark - 点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)getCacheSize{
    
    //总大小
    unsigned long long size = 0;
    //文件缓存路径
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];

    //获取文件夹大小
    NSArray *subpaths = [manager subpathsAtPath:cachesPath];
    for (NSString *subpath in subpaths) {
        //全路径
        NSString *fullpath = [cachesPath stringByAppendingPathComponent:subpath];
        //文件属性
        NSDictionary *attrs = [manager attributesOfItemAtPath:fullpath error:nil];
        //累加文件大小
//        size += [attrs[NSFileSize] unsignedIntegerValue];
        size += attrs.fileSize;
    }
    CustomLog(@"%zd",size);
}

@end

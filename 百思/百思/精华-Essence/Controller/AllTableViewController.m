
//
//  AllTableViewController.m
//  百思
//
//  Created by 赵博 on 16/7/25.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "AllTableViewController.h"
#import "CustomHTTPSessionManager.h"
#import "Topic.h"
#import <UIImageView+WebCache.h>
#import <MJRefresh.h>
#import "CustomRefreshHeader.h"
#import "CustomNormalAutoFooter.h"
#import "TopicCell.h"
@interface AllTableViewController ()

@property(nonatomic, strong) NSMutableArray *tempArray;
@property(nonatomic, weak) UILabel *label;
@property(nonatomic, retain) NSString *maxtime;
@property(nonatomic, strong) CustomHTTPSessionManager *manager;
@property(nonatomic, strong) NSArray *top_cmt_array;
@end
static NSString *const TopicCellId = @"topic";
@implementation AllTableViewController
//懒加载
- (CustomHTTPSessionManager *)manager{
    if (!_manager) {
        _manager  = [CustomHTTPSessionManager manager];
    }
    return _manager;
}
- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self setupTable];
    [self setupRefresh];
    
}
- (void)setupTable{
    self.view.backgroundColor = CommonBgColor;
    self.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.rowHeight = 250;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TopicCell class]) bundle:nil] forCellReuseIdentifier:TopicCellId];
}
//刷新方法
- (void)setupRefresh{
    self.tableView.mj_header = [CustomRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopic)];
    //一进页面就刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [CustomNormalAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopic)];
}
//取消请求会进入AFN的failure
- (void)loadNewTopic{
    //取消所有 请求
//    for (NSURLSessionTask *tasks in self.manager.tasks) {
//        [tasks cancel];
//    }
    //同时上拉下拉->取消所有请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    //参数
    NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
    parmas[@"a"] = @"list";
    parmas[@"c"] = @"data";
    //发送请求
    [self.manager GET:CommonUrl parameters:parmas success:^(NSURLSessionDataTask *task, id responseObject) {
        self.tempArray = [NSMutableArray array];
        self.top_cmt_array = [NSArray array];
        NSDictionary *dictionary = responseObject;
        //存储一下maxtime;
        self.maxtime = dictionary[@"info"][@"maxtime"];
        for (NSDictionary *dict in dictionary[@"list"]) {
            Topic *topic = [[Topic alloc] init];
            [topic setValuesForKeysWithDictionary:dict];
            [self.tempArray addObject:topic];
        }
        for (NSDictionary *dic in responseObject[@"list"]) {
            self.top_cmt_array = dic[@"top_cmt"];
        }
        //刷新数据-不然不会再调用数据源方法
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (error.code == NSURLErrorCancelled) {
            //取消任务
        }else{
            
        }
        [self.tableView.mj_header endRefreshing];

    }];
    
}
- (void)loadMoreTopic{
    //同时上拉下拉->取消所有请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    //参数
    NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
    parmas[@"a"] = @"list";
    parmas[@"c"] = @"data";
    parmas[@"maxtime"] = self.maxtime;
    //发送请求
    [self.manager GET:CommonUrl parameters:parmas success:^(NSURLSessionDataTask *task, id responseObject) {
       //存储这页的maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        NSDictionary *dictionary = responseObject;
        for (NSDictionary *dict in dictionary[@"list"]) {
            Topic *topic = [[Topic alloc] init];
            [topic setValuesForKeysWithDictionary:dict];
            [self.tempArray addObject:topic];
        }
        //刷新数据-不然不会再调用数据源方法
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        CustomLog(@"请求成功- %@",error);
        [self.tableView.mj_header endRefreshing];
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tempArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:TopicCellId];

    cell.topic = self.tempArray[indexPath.row];

    return cell;
}

@end

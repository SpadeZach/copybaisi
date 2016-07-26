
//
//  AllTableViewController.m
//  百思
//
//  Created by 赵博 on 16/7/25.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "AllTableViewController.h"
#import <AFNetworking.h>
#import "Topic.h"
#import <UIImageView+WebCache.h>
@interface AllTableViewController ()

@property(nonatomic, strong) NSMutableArray *tempArray;

@end

@implementation AllTableViewController

- (void)viewDidLoad {
    [self loadNewTopics];
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
}

- (void)loadNewTopics{
    
    //参数
    NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
    parmas[@"a"] = @"list";
    parmas[@"c"] = @"data";
    //发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parmas success:^(NSURLSessionDataTask *task, id responseObject) {
        self.tempArray = [NSMutableArray array];
        NSDictionary *dictionary = responseObject;
        for (NSDictionary *dict in dictionary[@"list"]) {
            Topic *topic = [[Topic alloc] init];
            [topic setValuesForKeysWithDictionary:dict];
            [self.tempArray addObject:topic];
        }
        //刷新数据-不然不会再调用数据源方法
        [self.tableView reloadData];

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        CustomLog(@"请求成功- %@",error);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"----%ld",self.tempArray.count);
    return self.tempArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIndetify = @"cellInd";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndetify];
    }
    Topic *topic = self.tempArray[indexPath.row];
    cell.textLabel.text = topic.name;
    cell.detailTextLabel.text = topic.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    return cell;
}



@end

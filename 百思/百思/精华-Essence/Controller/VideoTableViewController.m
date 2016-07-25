//
//  VideoTableViewController.m
//  百思
//
//  Created by 赵博 on 16/7/25.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "VideoTableViewController.h"

@interface VideoTableViewController ()

@end

@implementation VideoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIndetify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %ld",[self class],indexPath.row];
    // Configure the cell...self.childViewControllers.count
    
    return cell;
}


@end

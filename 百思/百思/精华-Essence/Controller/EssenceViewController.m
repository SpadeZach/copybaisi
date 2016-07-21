//
//  EssenceViewController.m
//  百思
//
//  Created by 赵博 on 16/7/14.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "EssenceViewController.h"

@interface EssenceViewController ()

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CommonBgColor;
    //标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //左边按钮
    UIBarButtonItem *buttonItem =[UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
  
    self.navigationItem.leftBarButtonItem = buttonItem;
}
- (void)tagClick{
  
}

@end

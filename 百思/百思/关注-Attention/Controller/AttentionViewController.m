//
//  AttentionViewController.m
//  百思
//
//  Created by 赵博 on 16/7/14.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "AttentionViewController.h"
#import "RecommendAttentionViewController.h"
#import "LoginRegisterViewController.h"
@interface AttentionViewController ()

@end

@implementation AttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CommonBgColor;
    //标题（不建议直接使用self.title）
    self.navigationItem.title = @"我的关注";
    
    //左边按钮
    UIBarButtonItem *buttonItem =[UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(tagClick)];
    
    self.navigationItem.leftBarButtonItem = buttonItem;
}
- (void)tagClick{
    //跳转-推荐关注
    RecommendAttentionViewController *ecommendAttentionVC = [[RecommendAttentionViewController alloc] init];

    [self.navigationController pushViewController:ecommendAttentionVC  animated:YES];
}
- (IBAction)loginRegister:(id)sender {
    LoginRegisterViewController *testVC = [[LoginRegisterViewController alloc] init];
    [self presentViewController:testVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  AttentionViewController.m
//  百思
//
//  Created by 赵博 on 16/7/14.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "AttentionViewController.h"
#import "RecommendAttentionViewController.h"
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
    RecommendAttentionViewController *ecommendAttentionVC = [[RecommendAttentionViewController alloc] init];

    [self.navigationController pushViewController:ecommendAttentionVC  animated:YES];
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

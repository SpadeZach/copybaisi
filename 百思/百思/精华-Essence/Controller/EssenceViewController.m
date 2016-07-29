//
//  EssenceViewController.m
//  百思
//
//  Created by 赵博 on 16/7/14.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "EssenceViewController.h"
#import "TitleButton.h"
#import "AllTableViewController.h"
#import "VideoTableViewController.h"
#import "VoiceTableViewController.h"
#import "PictureTableViewController.h"
#import "WordTableViewController.h"
@interface EssenceViewController ()<UIScrollViewDelegate>
//选中按钮
@property(nonatomic, weak) UIButton *selectedBtn;
//标题按钮指示器
@property(nonatomic, weak) UIView *indicatorView;
@property(nonatomic, weak) UIScrollView *scrollView;
//标题栏
@property(nonatomic, weak) UIView *titleView;
@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
    
    [self setupChildViewControllers];
    
    [self setupScrollView];
    
    [self setupTitleView];
    //默认页
    [self addChildVC];
    
   
}
- (void)setupNav{
    self.view.backgroundColor = CommonBgColor;
    //标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //左边按钮
    UIBarButtonItem *buttonItem =[UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    self.navigationItem.leftBarButtonItem = buttonItem;
}
- (void)setupScrollView{
    //不允许自动调整scrollView内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = CommonBgColor;
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.custom_width, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    self.scrollView = scrollView;
//    for (int i = 0; i < self.childViewControllers.count; i++) {
//        UITableView *childView = (UITableView *)self.childViewControllers[i].view;
//        childView.custom_x = i * childView.custom_width;
//        childView.custom_y = 0;
//        childView.custom_height = scrollView.custom_height;
//        [scrollView addSubview:childView];
//        //调整内边距
//        childView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
//        //滚动条起始位置
//        childView.scrollIndicatorInsets = childView.contentInset;
//  
//    }
//    
   
}
- (void)setupTitleView{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.custom_width, 40)];
    titleView.backgroundColor = CustomColor(255.0f, 255.0f, 255.0f, 0.7);
    
    //添加标题
    NSArray *array = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    //添加标题按钮
    for (int i = 0; i < array.count; i++) {
        TitleButton *titleBtn = [TitleButton buttonWithType:UIButtonTypeCustom];
        titleBtn.tag = 1 + i;
        [titleBtn setTitle:array[i] forState:UIControlStateNormal];
        titleBtn.custom_width = titleView.custom_width / 5;
        titleBtn.custom_height = titleView.custom_height;
        titleBtn.custom_x = i * titleBtn.custom_width;
        titleBtn.custom_y = 0;
        
        [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:titleBtn];
    }
    //标题栏底部分割线颜色
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, titleView.custom_height - 1, titleView.custom_width, 1)];
    grayView.backgroundColor = CustomColor(178, 178, 178, 1);
    [titleView addSubview:grayView];
    //按钮选中颜色
    TitleButton *firstBtn = titleView.subviews.firstObject;
   
    //底部指示器
    UIView *redView =[[UIView alloc] init];
    [titleView addSubview:redView];
    redView.backgroundColor = [firstBtn titleColorForState:UIControlStateSelected];
    [self.view addSubview:titleView];
    
    self.titleView = titleView;
    
    redView.custom_height = 1;
    redView.custom_y = titleView.custom_height - 2;
    
    self.indicatorView = redView;
    
    //默认选中第一个
    //让文字重新计算一下
    [firstBtn.titleLabel sizeToFit];
    redView.custom_width = firstBtn.titleLabel.custom_width + 10;
    redView.custom_CenterX = firstBtn.custom_CenterX;
    [self titleClick:firstBtn];
}
#pragma mark - 标题点击
- (void)titleClick:(UIButton *)titleButton{

    self.selectedBtn.selected = NO;
    titleButton.selected = YES;
    self.selectedBtn = titleButton;
    
   
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.custom_width = titleButton.titleLabel.custom_width + 10;
        self.indicatorView.custom_CenterX = titleButton.custom_CenterX;
    }];
    //让UIScrollView滚动到对应位置
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = (titleButton.tag - 1) * self.scrollView.custom_width;
        [self.scrollView setContentOffset:offset animated:YES];
    }];
}
- (void)setupChildViewControllers{
    AllTableViewController *allTVC = [[AllTableViewController alloc] init];
    [self addChildViewController:allTVC];
    VideoTableViewController *viedoTVC = [[VideoTableViewController alloc] init];
    [self addChildViewController:viedoTVC];
    VoiceTableViewController *voiceTVC = [[VoiceTableViewController alloc] init];
    [self addChildViewController:voiceTVC];
    PictureTableViewController *pictureTVC = [[PictureTableViewController alloc] init];
    [self addChildViewController:pictureTVC];
    WordTableViewController *wordTVC = [[WordTableViewController alloc] init];
    [self addChildViewController:wordTVC];
    
}
//添加子控制器的view
- (void)addChildVC{
    NSInteger index = self.scrollView.contentOffset.x / self.scrollView.custom_width;
   
    
    //取出子控制器
    UIViewController *childVC = self.childViewControllers[index];
    if (childVC.view.superview) {
        return;
    }
//    childVC.view.custom_x = index *self.scrollView.custom_width;
//    childVC.view.custom_y = 0;
//    childVC.view.custom_width = self.scrollView.custom_width;
//    childVC.view.custom_height = self.scrollView.custom_height;
    childVC.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVC.view];
}
#pragma mark - <ScrollDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    [self addChildVC];
}
//人为拖拽调用这个方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //对应按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.custom_width;
    TitleButton *titleBtn = self.titleView.subviews[index];
    [self titleClick:titleBtn];
    [self addChildVC];
}
- (void)tagClick{
  
}

@end

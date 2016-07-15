//
//  ZBTabBarViewController.m
//  百思
//
//  Created by 赵博 on 16/7/12.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "ZBTabBarViewController.h"
#import "CustomTabBar.h"
#import "EssenceViewController.h"
#import "FirstNewViewController.h"
#import "AttentionViewController.h"
#import "MeViewController.h"
#import "CustomNavigationViewController.h"
@interface ZBTabBarViewController ()

@end

@implementation ZBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置多有UITabBarItem的文字属性
    [self setupTitleTextAttributes];
    //添加子控制器
    [self setupChildViewControllers];
    //更换TabBar
    [self setValue:[[CustomTabBar alloc] init]forKeyPath:@"tabBar"];
}
/**
 *  初始化一个子控制器
 *
 *  @param vc         子控制器类名
 *  @param title         标题
 *  @param image         图标
 *  @param selectedImage 选中图标
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
 
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    //加载图片
    UIImage *tempImage = [UIImage imageNamed:selectedImage];
    //产生一张不会被渲染的图片
    UIImage *seleImage= [tempImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = seleImage;

    [self addChildViewController:vc];
}
- (void)setupTitleTextAttributes{
    //获取所有按钮
    UITabBarItem *items = [UITabBarItem appearance];
    //点击状态下文字颜色 字号
    NSMutableDictionary *selectedattrs = [NSMutableDictionary dictionary];
    selectedattrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    //属性放在所有按钮
    [items setTitleTextAttributes:selectedattrs forState:UIControlStateSelected];
}
- (void)setupChildViewControllers{
    [self setupOneChildViewController:[[CustomNavigationViewController alloc] initWithRootViewController:[[EssenceViewController alloc] init]] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupOneChildViewController:[[CustomNavigationViewController alloc] initWithRootViewController:[[FirstNewViewController alloc] init]] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupOneChildViewController:[[CustomNavigationViewController alloc] initWithRootViewController:[[AttentionViewController alloc] init]] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupOneChildViewController:[[CustomNavigationViewController alloc] initWithRootViewController:[[MeViewController alloc] init]]title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

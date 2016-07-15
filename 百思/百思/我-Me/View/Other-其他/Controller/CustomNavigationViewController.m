//
//  CustomNavigationViewController.m
//  百思
//
//  Created by 赵博 on 16/7/15.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "CustomNavigationViewController.h"

@interface CustomNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CustomNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    self.interactivePopGestureRecognizer.delegate = self;
}
/**
 *  重写push方法
 *
 *  @param viewController 刚刚push进来的子控制器
 *  @param animated       动画
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //可以拦截到所有push的控制器
    
    //默认控制器没push的时候个数为0，但是当super开始push以后个数是1，就不是最开始的控制器了，所以需要判读
    if (self.childViewControllers.count > 0) {
        //不是最早进来的就进来
        //左上角
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBtn sizeToFit];
        //内边距-移动控件
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    
    //所有设置搞定后在push
    [super pushViewController:viewController animated:animated];
}
- (void)back{
    [self popViewControllerAnimated:YES];

}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    //等于1说明导航器只有一个控制器
//    if (self.childViewControllers.count == 1) {
//        return NO;
//    }
//    return YES;
    return self.childViewControllers.count > 1;
}
@end

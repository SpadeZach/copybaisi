//
//  LoginRegisterViewController.m
//  百思
//
//  Created by 赵博 on 16/7/17.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "LoginRegisterViewController.h"

@interface LoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;

@end

@implementation LoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置圆角xib设置
//    self.loginButton.layer.cornerRadius = 5;
//    self.loginButton.layer.masksToBounds = YES;
    
}
//控制器来控制状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}
//显示登录\注册界面
- (IBAction)showLoginOrRegister:(UIButton *)sender {
    //退出键盘
    [self.view endEditing:YES];
    
    if (self.leftMargin.constant) {
         //显示登录界面
        self.leftMargin.constant = 0;
        [sender setTitle:@"注册账号" forState:UIControlStateNormal];
    }else{
        //目前显示的是注册界面
        self.leftMargin.constant = - self.view.custom_width;
        [sender setTitle:@"已有账号？" forState:UIControlStateNormal];
    }
    [UIView animateWithDuration:0.7f animations:^{
        //强制刷新-刷新约束
        [self.view layoutIfNeeded];
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
//关闭按钮
- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end



//
//  CustomTabBar.m
//  百思
//
//  Created by 赵博 on 16/7/14.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "CustomTabBar.h"

@interface CustomTabBar ()

@property(nonatomic, weak ) UIButton *publishButton;

@end

@implementation CustomTabBar


#pragma mark - 懒加载
- (UIButton *)publishButton{
    if (!_publishButton) {
    
         UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton  setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton  setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton  addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}
//布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //设置所有TabBarButton的frame
    CGFloat buttonW = self.frame.size.width / 5;
    CGFloat buttonH = self.frame.size.height;
    //按钮索引
    int buttonIndex = 0;
    for (UIView *subview in self.subviews) {
        //过滤掉非UITabBarButton
        if (subview.class != NSClassFromString(@"UITabBarButton"))
            continue;
        CGFloat buttonX = buttonIndex * buttonW;
        
        if (buttonIndex >= 2) {
            buttonX += buttonW;
        }
          subview.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
        //增加索引
        buttonIndex++;
        
    }
    //设置中间发布按钮
    self.publishButton.custom_width = buttonW;
    self.publishButton.custom_height = buttonH;
    self.publishButton.custom_CenterX = self.custom_width / 2;
    self.publishButton.custom_CenterY = self.custom_height / 2;
    
    
    
}
- (void)publishClick{

}

@end

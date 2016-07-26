//
//  CustomRefreshHeader.m
//  百思
//
//  Created by 赵博 on 16/7/26.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "CustomRefreshHeader.h"

@interface CustomRefreshHeader ()
@property(nonatomic, retain)UIImageView *logo;
@end

@implementation CustomRefreshHeader

//控件的初始化方法
- (void)prepare{
    [super prepare];
    //根据拖拽看透明度
    self.automaticallyChangeAlpha = YES;
    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
    self.logo = [[UIImageView alloc] init];
    self.logo.image = [UIImage imageNamed:@"app_slogan"];
    [self addSubview:self.logo];
}
//摆放子控件
- (void)placeSubviews{
    [super placeSubviews];
    self.logo.custom_width = self.custom_width;
    self.logo.custom_height = 50;
    self.logo.custom_x = 0;
    self.logo.custom_y = - 50;
    
}

@end

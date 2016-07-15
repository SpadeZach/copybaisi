//
//  UIBarButtonItem+BarButtonItemExtension.m
//  百思
//
//  Created by 赵博 on 16/7/15.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "UIBarButtonItem+BarButtonItemExtension.h"

@implementation UIBarButtonItem (BarButtonItemExtension)
//导航条按钮封装
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //按钮大小等于图片大小
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

@end

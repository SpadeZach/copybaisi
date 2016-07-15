//
//  ItemManage.m
//  百思
//
//  Created by 赵博 on 16/7/15.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "ItemManage.h"

@implementation ItemManage

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //按钮大小等于图片大小
    [button sizeToFit];
    //    button.custom_size =[UIImage imageNamed:@"MainTagSubIconClick"].size;
    //    button.custom_size = button.currentImage.size;
    //返回值参数：传的是个控件 button
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end

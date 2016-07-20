//
//  LoginReisterTextField.m
//  百思
//
//  Created by 赵博 on 16/7/18.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "LoginReisterTextField.h"
#import <objc/runtime.h>
@implementation LoginReisterTextField

-(void)awakeFromNib{
    //设置光标颜色
    self.tintColor = [UIColor whiteColor];
    //占位文字颜色
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:[UIColor lightTextColor]}];
}

//调用时刻：成为第一响应者
- (BOOL)becomeFirstResponder{
    self.placehoderColor = [UIColor whiteColor];
    return [super becomeFirstResponder];
}
//结束时刻：失去响应者
- (BOOL)resignFirstResponder{
    [self setValue:[UIColor lightTextColor] forKeyPath:@"placeholderLabel.textColor"];
    return [super resignFirstResponder];
}
@end

//
//  QuickLoginButton.m
//  百思
//
//  Created by 赵博 on 16/7/17.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "QuickLoginButton.h"

@implementation QuickLoginButton
- (void)awakeFromNib{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.custom_y = 0;
    self.imageView.custom_CenterX = self.custom_width * 0.5;
    self.titleLabel.custom_x = 0;
    self.titleLabel.custom_y = self.imageView.custom_botton;
    self.titleLabel.custom_height = self.custom_height - self.titleLabel.custom_y;
    self.titleLabel.custom_width = self.custom_width;
}

@end

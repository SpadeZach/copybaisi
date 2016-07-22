//
//  MeSquareButton.m
//  百思
//
//  Created by 赵博 on 16/7/22.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "MeSquareButton.h"
#import "MeSquare.h"
#import <UIButton+WebCache.h>
@implementation MeSquareButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.custom_y = self.custom_height * 0.1;
    self.imageView.custom_height = self.custom_height * 0.5;
    self.imageView.custom_width = self.imageView.custom_height;
    self.imageView.custom_CenterX = self.custom_width * 0.5;
    
    self.titleLabel.custom_x = 0;
    self.titleLabel.custom_y = self.imageView.custom_botton;
    self.titleLabel.custom_width = self.custom_width;
    self.titleLabel.custom_height = self.custom_height - self.titleLabel.custom_y;
}
- (void)setSquare:(MeSquare *)square{
    _square = square;
    //设置数据
    [self setTitle:square.name forState:UIControlStateNormal];
    //占位图
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
}
@end

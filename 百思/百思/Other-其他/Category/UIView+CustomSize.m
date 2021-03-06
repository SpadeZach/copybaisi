//
//  UIView+CustomSize.m
//  百思
//
//  Created by 赵博 on 16/7/14.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "UIView+CustomSize.h"

@implementation UIView (CustomSize)

- (CGFloat)custom_width{
    return self.frame.size.width;
}
- (CGFloat)custom_height{
    return self.frame.size.height;
}
- (CGFloat)custom_x{
    return self.frame.origin.x;
}
- (CGFloat)custom_y{
    return self.frame.origin.y;;
}
- (CGFloat)custom_CenterX{
    return self.center.x;
}
- (CGFloat)custom_CenterY{
    return self.center.y;
}

- (void)setCustom_width:(CGFloat)custom_width{
    CGRect frame = self.frame;
    frame.size.width = custom_width;
    self.frame = frame;
}
- (void)setCustom_height:(CGFloat)custom_height{
    CGRect frame = self.frame;
    frame.size.height = custom_height;
    self.frame = frame;
}
- (void)setCustom_x:(CGFloat)custom_x{
    CGRect frame = self.frame;
    frame.origin.x = custom_x;
    self.frame = frame;
}
- (void)setCustom_y:(CGFloat)custom_y{
    CGRect frame = self.frame;
    frame.origin.y = custom_y;
    self.frame = frame;
}
- (void)setCustom_CenterX:(CGFloat)custom_CenterX{
    CGPoint center = self.center;
    center.x = custom_CenterX;
    self.center = center;
}

- (void)setCustom_CenterY:(CGFloat)custom_CenterY{
    CGPoint center = self.center;
    center.y  = custom_CenterY;
    self.center = center;
}

@end

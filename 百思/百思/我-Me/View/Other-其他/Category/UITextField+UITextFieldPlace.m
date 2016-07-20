//
//  UITextField+UITextFieldPlace.m
//  百思
//
//  Created by 赵博 on 16/7/20.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "UITextField+UITextFieldPlace.h"

@implementation UITextField (UITextFieldPlace)
- (void)setPlacehoderColor:(UIColor *)placehoderColor{
    

    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @""; //提前设置占位文字
    self.placeholder = oldPlaceholder;
    if (placehoderColor == nil) {
        placehoderColor = CustomColor(0, 0, 0.0980392, 0.22);
    }
    
    [self setValue:placehoderColor forKeyPath:@"placeholderLabel.textColor"];
}
- (UIColor *)placehoderColor{
    return [self valueForKeyPath:@"placeholderLabel.textColor"];
}

@end

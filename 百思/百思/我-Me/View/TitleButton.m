
//
//  TitleButton.m
//  百思
//
//  Created by 赵博 on 16/7/25.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}
- (void)setHighlighted:(BOOL)highlighted{
    
}

@end

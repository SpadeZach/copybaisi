//
//  ItemManage.h
//  百思
//
//  Created by 赵博 on 16/7/15.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemManage : NSObject
//这么写 没有写UIBarButtonItem好所以写在延展中

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end

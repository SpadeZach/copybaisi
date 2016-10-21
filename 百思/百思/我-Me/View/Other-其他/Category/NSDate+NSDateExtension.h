//
//  NSDate+NSDateExtension.h
//  百思
//
//  Created by 赵博 on 16/8/1.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NSDateExtension)
/**
 * 是否为今年
 */
- (BOOL)isThisYear;
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为明天
 */
- (BOOL) isTomorrow;
@end

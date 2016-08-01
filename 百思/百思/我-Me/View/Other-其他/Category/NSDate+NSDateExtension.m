//
//  NSDate+NSDateExtension.m
//  百思
//
//  Created by 赵博 on 16/8/1.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "NSDate+NSDateExtension.h"

@implementation NSDate (NSDateExtension)
- (BOOL)isThisYear{
    //判断self这个日期是否为今年
//    NSDate *selfDate = self;
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar calendar];
    
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:nowDate];
    
    return selfYear == nowYear;
}
@end

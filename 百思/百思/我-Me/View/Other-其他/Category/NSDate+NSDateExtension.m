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
//- (BOOL)isToday{
//    //判断self这个日期是否为今天
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyyMMdd";
//    //
//    NSString *selfStr = [fmt stringFromDate:self];
//    NSString *nowStr = [fmt stringFromDate:[NSDate date]];
//    return [selfStr isEqualToString:nowStr];
//}
- (BOOL)isToday{
    //判断self这个日期是否为今天
    NSCalendar *calendar = [NSCalendar calendar];
    NSCalendarUnit unit = NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    return selfCmps.year == nowCmps.year && selfCmps.month == selfCmps.month && selfCmps.day == nowCmps.day;
}
- (BOOL)isYesterday{
    //判断self这个日期是否为昨天
    //self 2016-10-20 09:29:20; ->2016-10-20 00:00:00
    //now 2016-10-21 13:06:00; ->2016-10-21 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    NSString *selfString = [fmt stringFromDate:self];//2016-10-20
    NSString *nowString = [fmt stringFromDate:[NSDate date]];//2016-10-21
    NSDate *selfDate = [fmt dateFromString:selfString]; //2016-10-20 00:00:00

    NSDate *nowDate = [fmt dateFromString:nowString];//2016-10-21 00:00:00
     NSCalendarUnit unit = NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay;
    NSCalendar *calendar = [NSCalendar calendar];
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    return cmps.year == 0
    && cmps.month == 0
    & cmps.day == 1;
}
- (BOOL)isTomorrow{
    //判断self这个日期是否为昨天
    //self 2016-10-20 09:29:20; ->2016-10-20 00:00:00
    //now 2016-10-21 13:06:00; ->2016-10-21 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    NSString *selfString = [fmt stringFromDate:self];//2016-10-20
    NSString *nowString = [fmt stringFromDate:[NSDate date]];//2016-10-21
    NSDate *selfDate = [fmt dateFromString:selfString]; //2016-10-20 00:00:00
    
    NSDate *nowDate = [fmt dateFromString:nowString];//2016-10-21 00:00:00
    NSCalendarUnit unit = NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay;
    NSCalendar *calendar = [NSCalendar calendar];
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    return cmps.year == 0
    && cmps.month == 0
    & cmps.day == -1;
}
@end

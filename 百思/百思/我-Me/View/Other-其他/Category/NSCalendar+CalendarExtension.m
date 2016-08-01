//
//  NSCalendar+CalendarExtension.m
//  百思
//
//  Created by 赵博 on 16/8/1.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "NSCalendar+CalendarExtension.h"

@implementation NSCalendar (CalendarExtension)

+ (instancetype)calendar
{
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return [NSCalendar currentCalendar];
    }
}

@end

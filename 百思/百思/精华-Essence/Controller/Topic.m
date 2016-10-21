//
//  Topic.m
//  百思
//
//  Created by 赵博 on 16/7/26.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "Topic.h"

@implementation Topic
static NSDateFormatter *fmt_;
static NSCalendar *calendar_;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}
//这个方法只调用一次
+ (void)initialize{
    //格式
    fmt_ = [[NSDateFormatter alloc] init];
    calendar_ = [NSCalendar calendar];
}
// 1分钟:刚刚 \10分钟前 \ 5小时前 \ 昨天\ 08-01 13:51:00  \ 2015-08-0113:51:00
- (NSString *)created_at{
    fmt_.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //获得发帖日期 不能使用self self. 会retain先-1然后坏内存 _XX是直接指向
    NSDate *createdAtDate = [fmt_ dateFromString:_created_at];
    //是否今年
    if (createdAtDate.isThisYear) {
        //今天
//        [calendar_ isDateInToday:createdAtDate] IOS8.0
        if (createdAtDate.isToday) {
            // 手机当前时间
            NSDate *nowDate = [NSDate date];

            NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            //获得日期之间的间隔
            NSDateComponents *cmps = [calendar_ components:unit fromDate:createdAtDate toDate:nowDate options:0];
            if (cmps.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时前",cmps.hour];
            }else if (cmps.minute > 1){
                return [NSString stringWithFormat:@"%ld分钟",cmps.minute];
            }else{
                return @"刚刚";
            }
        }else if(createdAtDate.isYesterday){
            //昨天
            fmt_.dateFormat = @"昨天 HH:mm:ss";
            return [fmt_ stringFromDate:createdAtDate];
        }else{
            //其他
            fmt_.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt_ stringFromDate:createdAtDate];
        }
        
    }else{
      //其他年
      return _created_at;
    }
}

@end

//
//  Topic.m
//  百思
//
//  Created by 赵博 on 16/7/26.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "Topic.h"

@implementation Topic
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

@end

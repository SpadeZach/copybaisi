//
//  NSString+NStringExtension.m
//  百思
//
//  Created by 赵博 on 16/7/24.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "NSString+NStringExtension.h"

@implementation NSString (NStringExtension)
- (unsigned long long)fileSize{
    //总大小
    unsigned long long size = 0;
  
    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    //文件夹属性
    NSDictionary *attrs =[manager attributesOfItemAtPath:self error:nil];
    //如果是个文件夹就进去
    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) {
        //Enumerator：叫做迭代器
        //获取文件夹的大小，文件夹中所有文件
        NSDirectoryEnumerator *subpaths = [manager enumeratorAtPath:self];
        for (NSString *subpath in subpaths) {
            //全路径
            NSString *fullpath = [self stringByAppendingPathComponent:subpath];
            //累加文件大小
            size += [manager attributesOfItemAtPath:fullpath error:nil].fileSize;
        }
    }else{
        //文件
        size = attrs.fileSize;
    }
    
    
    return size;
}


@end

//
//  Topic.h
//  百思
//
//  Created by 赵博 on 16/7/26.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject
@property(nonatomic, copy) NSString *ID;
/**
 *  用户名字
 */
@property(nonatomic, copy) NSString *name;
/**
 *  用户头像
 */
@property(nonatomic, copy) NSString *profile_image;
/**
 *  帖子的文字内容
 */
@property(nonatomic, copy) NSString *text;
/**
 *  帖子审核通过时间
 */
@property(nonatomic, copy) NSString *created_at;
/**
 *  顶数量
 */
@property(nonatomic, assign) NSInteger ding;
/**
 *  踩数量
 */
@property(nonatomic, assign) NSInteger cai;
/**
 *  转发/分享数量
 */
@property(nonatomic, assign) NSInteger repost;
/**
 *  评论数量
 */
@property(nonatomic, assign) NSInteger comment;

@end

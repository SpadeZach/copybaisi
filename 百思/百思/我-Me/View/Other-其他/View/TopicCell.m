//
//  TopicCell.m
//  百思
//
//  Created by 赵博 on 16/7/28.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "TopicCell.h"
#import "Topic.h"
#import <UIImageView+WebCache.h>
@implementation TopicCell
- (void)awakeFromNib{
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}
- (void)setTopic:(Topic *)topic{

    _topic = topic;

    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
    self.createdAtLabel.text = topic.created_at;
    self.text_label.text = topic.text;
    [self.dingButton setTitle:[NSString stringWithFormat:@"%ld",topic.ding] forState:UIControlStateNormal];
    [self.caiButton setTitle:[NSString stringWithFormat:@"%ld",topic.cai] forState:UIControlStateNormal];
    [self.repostButton setTitle:[NSString stringWithFormat:@"%ld",topic.repost] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%ld",topic.comment] forState:UIControlStateNormal];
    
}

@end

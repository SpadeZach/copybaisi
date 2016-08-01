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
//如果不希望外面有人修改值，就要重写这个方法
- (void)setFrame:(CGRect)frame{
    frame.size.height -= CustomMargin;
//    frame.origin.x += CustomMargin;
//    frame.size.width -= CustomMargin * 2;
    frame.origin.y += CustomMargin;
    [super setFrame:frame];
    
}
- (void)awakeFromNib{
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}
- (void)setTopic:(Topic *)topic{

    _topic = topic;

    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
    self.createdAtLabel.text = topic.created_at;
    self.text_label.text = topic.text;
    
    
    [self buttonWithTitle:self.dingButton number:topic.ding placeholder:@"顶"];
    [self buttonWithTitle:self.caiButton number:topic.cai placeholder:@"踩"];
    [self buttonWithTitle:self.repostButton number:topic.repost placeholder:@"分享"];
    [self buttonWithTitle:self.commentButton number:topic.comment placeholder:@"评论"];
}
/*
 顶踩等按钮
 数量>10000 显示1.0万;
 数量==0 显示中文 顶/踩
 */
- (void)buttonWithTitle:(UIButton *)button number:(NSInteger)number placeholder:(NSString *)placeholder{
    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%ld万",number /10000] forState:UIControlStateNormal];
    }else if (number> 0){
        [button setTitle:[NSString stringWithFormat:@"%ld",number] forState:UIControlStateNormal];
    }else{
        [button setTitle:placeholder forState:UIControlStateNormal];
    }
}
- (IBAction)more:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    
    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}


@end

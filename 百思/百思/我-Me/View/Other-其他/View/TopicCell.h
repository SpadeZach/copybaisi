//
//  TopicCell.h
//  百思
//
//  Created by 赵博 on 16/7/28.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Topic;
@interface TopicCell : UITableViewCell
@property(nonatomic, strong)Topic *topic;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
/** 最热评论-整体 */
@property (weak, nonatomic) IBOutlet UIView *topCmtView;
@property (weak, nonatomic) IBOutlet UILabel *topCmtContentLabel;


@end

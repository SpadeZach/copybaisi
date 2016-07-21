//
//  MeCell.m
//  百思
//
//  Created by 赵博 on 16/7/21.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "MeCell.h"

@implementation MeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //内容模式-图片设置后不变形
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.imageView.image == nil) {
        return;
    }
    //imageView位置
    self.imageView.custom_y = CustomSmallMargin;
    self.imageView.custom_height = self.contentView.custom_height - 2 * CustomSmallMargin;
    //label位置
    self.textLabel.custom_x = self.imageView.custom_right + CustomSmallMargin;
    
}
@end

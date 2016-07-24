//
//  ClearCacheTableViewCell.m
//  百思
//
//  Created by 赵博 on 16/7/24.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "ClearCacheTableViewCell.h"
#import <SVProgressHUD.h>
#import <SDImageCache.h>
@implementation ClearCacheTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //活动指示器
        UIActivityIndicatorView  *loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        //默认不会开启
        [loadView startAnimating];
        //如果缓存过大
        self.accessoryView = loadView;
        self.textLabel.text = @"清除缓存(正在计算缓存大小...)";
        //子线程缓存大小
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //框架下 获取图片大小
            CGFloat size = [SDImageCache sharedImageCache].getSize;
            NSString *midSizeText = nil;
            if (size >= pow(10, 9)) {
                //10的9次方
                //size >= 1GB
                midSizeText = [NSString stringWithFormat:@"%.2fGB",size / pow(10, 9)];
            }else if (size >= pow(10, 6)){
                //1GB> size >= 1MB
                midSizeText = [NSString stringWithFormat:@"%.2fMB",size / pow(10, 6)];
            }else if (size >= 1000){
                //1MB> size >= 1KB
                midSizeText = [NSString stringWithFormat:@"%.2fKB",size / 1000];
            }else{
                midSizeText = [NSString stringWithFormat:@"%zdB",size];
            }
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)",midSizeText];
            //回到主线程设置文字
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.textLabel.text = text;
                //清空cell右边指示View
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            });
           [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearCache)]];
            
        });
        
    } 
    return self;
    
}
- (void)clearCache{
    //弹出指示器
    [SVProgressHUD showWithStatus:@"正在删除缓存" maskType:SVProgressHUDMaskTypeBlack];
    //删掉缓存文件
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        //默认SDImageCache为子线程完成时不确定时间所以用block让他俩同时完成以后再进行别的错做
        //删除自定义缓存文件
        NSFileManager *manager = [NSFileManager defaultManager];
        [manager removeItemAtPath:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingString:@"Custom"] error:nil];
        //创建回来
        [manager createDirectoryAtPath:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingString:@"Custon"] withIntermediateDirectories:YES attributes:nil error:nil];
        //所有缓存都处理完毕
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //隐藏指示器
            [SVProgressHUD dismiss];
            self.textLabel.text = @"清除缓存(0KB)";
        });
    }];
}

@end

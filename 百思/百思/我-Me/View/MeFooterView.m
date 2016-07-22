

//
//  MeFooterView.m
//  百思
//
//  Created by 赵博 on 16/7/21.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "MeFooterView.h"
#import <AFNetworking.h>
#import "MeSquare.h"

#import "MeSquareButton.h"
#import "MeWebViewController.h"

@interface MeFooterView ()
@property(nonatomic, retain)NSMutableArray *tempArray;
@end

@implementation MeFooterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //参数
        NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
        parmas[@"a"] = @"square";
        parmas[@"c"] = @"topic";
        //发送请求
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parmas success:^(NSURLSessionDataTask *task, id responseObject) {
            self.tempArray = [NSMutableArray array];
            NSDictionary *dictionary = responseObject;
            for (NSMutableDictionary *dic in dictionary[@"square_list"]) {
                //字典->模型
                MeSquare *meSquare = [[MeSquare alloc] init];
                [meSquare setValuesForKeysWithDictionary:dic];
                
                [self.tempArray addObject:meSquare];
                
                [self creatSquare:self.tempArray];
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            CustomLog(@"请求失败--%@",error);
            
        }];
    }
    return self;
}
//根据模型数据创建对应控件
- (void)creatSquare:(NSMutableArray *)array{
    
    //按钮尺寸
    int maxColsCount = 4; //一行最多4列
    CGFloat btnSizeW = self.custom_width / maxColsCount;
    CGFloat btnSizeH = btnSizeW;
 
    //创建所有按钮
    for (int i = 0; i < array.count; i++) {
        //取出模型
        MeSquare *square = array[i];
        //创建按钮
        MeSquareButton *button = [MeSquareButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        //一个按钮绑定一个模型
        button.square = square;
        button.backgroundColor = [UIColor whiteColor];
        [self addSubview:button];
        //设置frame
        button.custom_x = (i % maxColsCount) *btnSizeW;
        button.custom_y = (i / maxColsCount) *btnSizeH;
        button.custom_width = btnSizeW;
        button.custom_height = btnSizeH;
      
    }
    //设置高度
    self.custom_height =self.subviews.lastObject.custom_botton;
    UITableView *table = (UITableView *)self.superview;
    table.tableFooterView = self;
    [table reloadData];
//    table.contentSize = CGSizeMake(0, self.custom_botton); 不靠谱
}

- (void)buttonClick:(MeSquareButton *)sender{
    MeSquare *square = sender.square;
    
    if ([square.url hasPrefix:@"http"]) {
        CustomLog(@"利用webView加载url");
    }else if ([square.url hasPrefix:@"mod"]){
        if([square.url hasSuffix:@"BDJ_To_Check"]){
           CustomLog(@"跳转到审帖");
        }else if ([square.url hasSuffix:@"BDJ_To_RecentHot"]){
            CustomLog(@"跳转到每日排行");
        }else{
            CustomLog(@"跳转其他页面");
        }
    }else{
        CustomLog(@"不是http或mod协议的");
    }
}

@end

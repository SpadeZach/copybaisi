//
//  MeWebViewController.m
//  百思
//
//  Created by 赵博 on 16/7/22.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "MeWebViewController.h"

@interface MeWebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;

@end

@implementation MeWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reload{
    [self.webView reload];
}
- (IBAction)back{
    [self.webView goBack];
}
- (IBAction)forward{
    [self.webView goForward];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.backItem.enabled = webView.canGoBack;
    self.forwardItem.enabled = webView.canGoForward;
}
@end

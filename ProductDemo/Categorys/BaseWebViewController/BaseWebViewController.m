//
//  BaseWebViewController.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/10.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    self.webView.delegate = self;
    
    NSURLRequest *requeset = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:requeset];
    
    [self.view addSubview:self.webView];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end

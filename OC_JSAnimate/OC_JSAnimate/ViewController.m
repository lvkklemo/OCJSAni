//
//  ViewController.m
//  OC_JSAnimate
//
//  Created by 宇航 on 17/6/9.
//  Copyright © 2017年 HWD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property(nonatomic,weak) UIWebView*webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIWebView*webV=[[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _webView=webV;
    webV.delegate=self;
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [webV loadHTMLString:html baseURL:baseURL];
    [self.view addSubview:webV];
    
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *URL = request.URL;
    NSLog(@"%@",URL);
    NSLog(@"Scheme: %@",[URL scheme]);
    NSLog(@"Host: %@", [URL host]);
    NSLog(@"Port: %@", [URL port]);
    NSLog(@"Path: %@", [URL path]);
    if ([[URL scheme] isEqualToString:@"haleyaction"]) {
        //[self handleCustomAction:URL];
        return NO;
    }
    return YES;
}

- (void)getLocation
{
    // 获取位置信息
    
    // 将结果返回给js
    NSString *jsStr = [NSString stringWithFormat:@"setLocation('%@')",@"广东省深圳市南山区学府路XXXX号"];
    [self.webView stringByEvaluatingJavaScriptFromString:jsStr];
}

@end

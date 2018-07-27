//
//  JSViewController.m
//  webview
//
//  Created by MacBookPro on 2018. 7. 20..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import "JSViewController.h"

@interface JSViewController ()

@end

@implementation JSViewController

@synthesize webView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // WebView
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    [webView setUIDelegate:self];
    
    [self.view addSubview:self.webView];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"callTest" ofType:@"html" inDirectory:@""];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    // call javascript button
    UIButton* callJavascriptBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 50, 150, 50)];
    [callJavascriptBtn setTitle:@"call javascript" forState:UIControlStateNormal];
    [callJavascriptBtn setBackgroundColor:[UIColor grayColor]];
    [callJavascriptBtn addTarget:self action:@selector(onCallJavascriptButton:) forControlEvents:UIControlEventTouchUpInside]; [self.view addSubview:callJavascriptBtn]; }

#pragma mark - Call javascript from objectiveC

- (void)onCallJavascriptButton:(id)sender {
    
    [self.webView stringByEvaluatingJavaScriptFromString:@"callJavascriptFromObjectiveC();"];
    
    [self.webView stringb]
}



@end

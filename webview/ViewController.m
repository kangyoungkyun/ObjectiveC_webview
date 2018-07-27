//
//  ViewController.m
//  webview
//
//  Created by MacBookPro on 2018. 7. 20..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize urlTextField, WebView,bookmarkSegmentControl,activityView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSString *urlString = @"https://www.facebook.com";
    [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
    urlTextField.text = urlString;
    
    urlTextField.delegate = self;
    
    [WebView setUIDelegate:self];
    [WebView setNavigationDelegate:self];
}

//엔터키 눌렀을 때
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"키보드가 눌렸습니다.");
    
    //텍스트 필드에 있는 내용 가져오기
    NSString *urlString = urlTextField.text;
    NSLog(@"%@", urlString);
    
    //https가 안붙여져 있으면 붙이기
    if(![urlString hasPrefix:@"https://"]){
        urlString = [[NSString alloc]initWithFormat:@"https://%@",urlString];
    }
    
    //웹뷰 로 이동
    [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
    //키보드 내려가게 만들기
    [textField resignFirstResponder];
    
    return YES;
}


//북마크 눌렸을때
- (IBAction)bookmarkAction:(id)sender {
    NSString *bookmarkURL = [bookmarkSegmentControl titleForSegmentAtIndex:bookmarkSegmentControl.selectedSegmentIndex];
    
    NSString *urlString = [[NSString alloc]initWithFormat:@"https://www.%@.com",bookmarkURL];
    [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
    urlTextField.text = urlString;
}


//웹뷰가 시작될때
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
     NSLog(@"webview start");
    [activityView startAnimating];
}


//웹뷰가 완료되었을 때
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"webview finish");
    [activityView stopAnimating];
}


@end

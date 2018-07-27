//
//  JSViewController.h
//  webview
//
//  Created by MacBookPro on 2018. 7. 20..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface JSViewController : UIViewController<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>

@property (nonatomic) WKWebView *webView;


@end

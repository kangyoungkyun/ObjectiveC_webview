//
//  ViewController.h
//  webview
//
//  Created by MacBookPro on 2018. 7. 20..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

//textfiled 델리게이트 , 웹 뷰 델리게이트
// WkWebView에서 주소가 변경되거나 스크립트를 사용할 경우 사용할 Delegate함수를 사용하기 위해
// 아래의 Delegate들을 참조합니다

@interface ViewController : UIViewController<UITextFieldDelegate,WKUIDelegate,WKNavigationDelegate>


@property (strong, nonatomic) IBOutlet UISegmentedControl *bookmarkSegmentControl;


@property (strong, nonatomic) IBOutlet UITextField *urlTextField;


@property (strong, nonatomic) IBOutlet WKWebView *WebView;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;


//북마크가 눌렸을 때
- (IBAction)bookmarkAction:(id)sender;



@end


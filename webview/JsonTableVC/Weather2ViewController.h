//
//  Weather2ViewController.h
//  webview
//
//  Created by MacBookPro on 2018. 7. 27..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Weather2ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSDictionary *datalist;
    NSArray *local;
}

@end

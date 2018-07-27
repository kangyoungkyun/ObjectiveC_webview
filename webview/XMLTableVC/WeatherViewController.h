//
//  WeatherViewController.h
//  webview
//
//  Created by MacBookPro on 2018. 7. 27..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>
{
    NSXMLParser *parser;
    NSMutableArray *datalist;
    NSMutableDictionary *detailData;

    BOOL blank;
    
    NSString *elementTemp;
}


@end

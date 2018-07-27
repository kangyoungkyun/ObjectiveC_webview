//
//  WeatherCell.h
//  webview
//
//  Created by MacBookPro on 2018. 7. 27..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *contry;

@property (strong, nonatomic) IBOutlet UILabel *weather;


@property (strong, nonatomic) IBOutlet UILabel *temper;

@end

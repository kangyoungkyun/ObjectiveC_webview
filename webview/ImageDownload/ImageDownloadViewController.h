//
//  ImageDownloadViewController.h
//  webview
//
//  Created by MacBookPro on 2018. 7. 27..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

//델리게이트 구현!
@interface ImageDownloadViewController : UIViewController<NSURLSessionDownloadDelegate>
{
    NSURLSessionTask *downloadTask;
}
@property (strong, nonatomic) IBOutlet UIImageView *image;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (strong, nonatomic) IBOutlet UIProgressView *progress;

- (IBAction)down:(id)sender;

- (IBAction)suspend:(id)sender;

- (IBAction)resume:(id)sender;

- (IBAction)cancel:(id)sender;

@end

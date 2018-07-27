//
//  ImageDownloadViewController.m
//  webview
//
//  Created by MacBookPro on 2018. 7. 27..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import "ImageDownloadViewController.h"

@interface ImageDownloadViewController ()

@end


@implementation ImageDownloadViewController
@synthesize indicator, image, progress;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//이미지 다운로드
- (IBAction)down:(id)sender {
    
    image.image = nil;
    [progress setProgress:0.0 animated:NO];
    [indicator startAnimating];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg"]];
    [downloadTask resume];
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
    NSLog(@"totalbytesExpectedToWrite : %lli",totalBytesExpectedToWrite);
     NSLog(@"bytesWritten : %lli",bytesWritten);
     NSLog(@"totalBytesWritten : %lli",totalBytesWritten);
    
    float progressFloat = (float)totalBytesWritten/(float)totalBytesExpectedToWrite;
    [progress setProgress:progressFloat animated:YES];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSData *data = [NSData dataWithContentsOfURL:location];
    image.image = [UIImage imageWithData:data];
    [indicator stopAnimating];
}


- (IBAction)suspend:(id)sender {
    [downloadTask suspend];
}

- (IBAction)resume:(id)sender {
    [downloadTask resume];
}

- (IBAction)cancel:(id)sender {
    [downloadTask cancel];
    image.image = nil;
    [progress setProgress:0.0 animated:NO];
     [indicator stopAnimating];
}
@end

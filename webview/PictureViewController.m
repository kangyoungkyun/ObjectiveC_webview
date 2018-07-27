//
//  PictureViewController.m
//  webview
//
//  Created by MacBookPro on 2018. 7. 20..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import "PictureViewController.h"

@interface PictureViewController ()

@end

@implementation PictureViewController
//viewController.m에서 선언했던 아웃렛 변수
@synthesize imageView, buttonTitle, numberLable, speedSlider;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *cuteImages = [[NSArray alloc]initWithObjects:
                           [UIImage imageNamed:@"1.jpeg"],
                           [UIImage imageNamed:@"2.jpeg"],
                           [UIImage imageNamed:@"3.jpeg"],
                           [UIImage imageNamed:@"4.jpeg"],
                           [UIImage imageNamed:@"5.jpeg"],
                           [UIImage imageNamed:@"6.jpeg"],
                           [UIImage imageNamed:@"7.jpeg"],
                           [UIImage imageNamed:@"8.jpeg"],
                           [UIImage imageNamed:@"9.jpeg"],
                           [UIImage imageNamed:@"10.jpeg"],
                           [UIImage imageNamed:@"11.jpeg"],
                           [UIImage imageNamed:@"12.jpeg"],
                           [UIImage imageNamed:@"13.jpeg"],
                           [UIImage imageNamed:@"14.jpeg"],
                           [UIImage imageNamed:@"15.jpeg"],
                           nil];
    
    //이미지 뷰 객체에 있는 매서드 animationImages에 위에 이미지 배열 할당
    imageView.animationImages = cuteImages;
    imageView.animationDuration = 15.0;
    
}

//시작버튼
- (IBAction)buttonAction:(id)sender {
    
    //애니메이션이 작동되고 있으면
    if([imageView isAnimating]){
        //정지
        [imageView stopAnimating];
        [buttonTitle setTitle:@"시작" forState:UIControlStateNormal];
        
    }else{
        //작동이 안되고 있으면 시작
        imageView.animationDuration = 15-speedSlider.value;
        [imageView startAnimating];
        [buttonTitle setTitle:@"정지" forState:UIControlStateNormal];
    }
    
}

//슬라이더 버튼
- (IBAction)sliderAction:(id)sender {
    imageView.animationDuration = 15-speedSlider.value;
    [imageView startAnimating];
    [buttonTitle setTitle:@"정지" forState:UIControlStateNormal];
    
    NSString *str = [[NSString alloc]initWithFormat:@"%.2f", speedSlider.value];
    numberLable.text = str;
    
}

@end

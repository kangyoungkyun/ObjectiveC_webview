//
//  PictureViewController.h
//  webview
//
//  Created by MacBookPro on 2018. 7. 20..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureViewController : UIViewController

//변수
int i;
}

//이미지뷰, 버튼제목, 숫자라벨
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *buttonTitle;
@property (strong, nonatomic) IBOutlet UILabel *numberLable;
@property (strong, nonatomic) IBOutlet UISlider *speedSlider;


- (IBAction)buttonAction:(id)sender;

- (IBAction)sliderAction:(id)sender;



@end

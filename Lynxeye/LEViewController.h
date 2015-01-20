//
//  LEViewController.h
//  Lynxeye
//
//  Created by Cong Thanh on 1/20/15.
//  Copyright (c) 2015 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"
#import "TouchedImageView.h"

@interface LEViewController : UIViewController<GADBannerViewDelegate, TouchedImageViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentLevel;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;

@property (weak, nonatomic) IBOutlet TouchedImageView *imvTopPicture;
@property (weak, nonatomic) IBOutlet TouchedImageView *imvBottomPicture;
@property (weak, nonatomic) IBOutlet UIView *viewSuggest;
@property (weak, nonatomic) IBOutlet UILabel *lblSuggestNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblCorrectNumber;

@property (weak, nonatomic) IBOutlet UIView *bottomBannerContainer;
@end

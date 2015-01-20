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
@property (weak, nonatomic) IBOutlet TouchedImageView *imvTopPicture;
@property (weak, nonatomic) IBOutlet TouchedImageView *imvBottomPicture;

@property (weak, nonatomic) IBOutlet UIView *bottomBannerContainer;
@end

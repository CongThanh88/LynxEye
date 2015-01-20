//
//  TouchedImageView.h
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapImageData.h"

@class TouchedImageView;

@protocol TouchedImageViewDelegate <NSObject>

-(void)touchedImageView:(TouchedImageView*)imageView markedOnFrame:(CGRect)frame;

@end

@interface TouchedImageView : UIImageView
@property(nonatomic,strong)MapImageData *data;
@property(nonatomic,weak)id<TouchedImageViewDelegate> delegate;
-(void)refreshView;
-(void)drawCircleOn:(CGRect)frame;
-(void)resetData;
@end

//
//  MarkPosition.h
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MarkPosition : NSObject
@property(nonatomic,assign) float start_X;
@property(nonatomic,assign) float end_X;
@property(nonatomic,assign) float start_Y;
@property(nonatomic,assign) float end_Y;
@property(nonatomic,assign) BOOL isChecked;

-(BOOL)isContainedPoint:(CGPoint)point;
-(CGRect)markFrame;
-(void)resizeBaseOnWidthRatio:(float)widthRatio andHeightRatio:(float)heightRatio;
+(MarkPosition*)parseData:(NSDictionary*)dictItem;
@end

//
//  MapImageData.h
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MarkPosition.h"

@interface MapImageData : NSObject
@property(nonatomic,strong)NSArray *listMarkPostions;
-(MarkPosition*)markedOnMapAtPosition:(CGPoint)point;
-(void)updateMarkPositionBaseOnWidthRatio:(float)widthRatio andHeightRatio:(float)heightRatio;
+(MapImageData*)parseData:(NSArray*)dictArray;
-(void)resetMarkPosition;
@end

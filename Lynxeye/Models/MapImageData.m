//
//  MapImageData.m
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "MapImageData.h"

@implementation MapImageData
-(MarkPosition*)markedOnMapAtPosition:(CGPoint)point
{
    if (point.x != NSNotFound  && point.y != NSNotFound) {
        for (MarkPosition *position in _listMarkPostions) {
            if (position && [position isContainedPoint:point]) {
                return position;
            }
        }
    }
    return nil;
}

-(void)updateMarkPositionBaseOnWidthRatio:(float)widthRatio andHeightRatio:(float)heightRatio
{
    if (_listMarkPostions && _listMarkPostions.count>0) {
        for (MarkPosition *position in _listMarkPostions) {
            if (position) {
                [position resizeBaseOnWidthRatio:widthRatio andHeightRatio:heightRatio];
            }
        }
    }
}

+(MapImageData*)parseData:(NSArray *)dictArray
{
    if (dictArray && dictArray.count>0) {
        MapImageData *mapData = [[MapImageData alloc]init];
        NSArray *listPositions = [[NSArray alloc]init];
        for (NSDictionary *dictItem in dictArray) {
            if (dictItem) {
                MarkPosition *position = [MarkPosition parseData:dictItem];
                if (position) {
                    listPositions = [listPositions arrayByAddingObject:position];
                }
            }
        }
        mapData.listMarkPostions = listPositions;
        return mapData;
    }
    return nil;
}

-(void)resetMarkPosition
{
    if (_listMarkPostions && _listMarkPostions) {
        for (MarkPosition *position in _listMarkPostions) {
            if (position) {
                position.isChecked = NO;
            }
        }
    }
}
@end

//
//  GameLevel.m
//  PicDifferent
//
//  Created by Apple on 1/9/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "GameLevel.h"


@implementation GameLevel
+(GameLevel*)parseData:(NSDictionary*)dict
{
    if (dict) {
        GameLevel *gameLevel = [[GameLevel alloc]init];
        gameLevel.leftImage =  [dict objectForKey:@"left_image"];
        gameLevel.rightImage = [dict objectForKey:@"right_image"];
        gameLevel.gameData = [MapImageData parseData:[dict objectForKey:@"checked_marks"]];
        
        //Update position
        CGSize realSize = [self getRealSize];
        CGSize imageSize = [self imageSize:gameLevel.leftImage];
        float ratioWidth = (realSize.width - imageSize.width)/imageSize.width;
        float ratioHeight = (realSize.height - imageSize.height)/imageSize.height;
        [gameLevel.gameData updateMarkPositionBaseOnWidthRatio:ratioWidth andHeightRatio:ratioHeight];
        
        return gameLevel;
        
    }
    return nil;
}

+(NSArray*)parseListData:(NSArray *)dictArray
{
    if (dictArray && dictArray.count>0) {
        NSArray *listGameLevels = [[NSArray alloc]init];
        for (NSDictionary *dictItem in dictArray) {
            if (dictItem) {
                GameLevel *gameLevel = [GameLevel parseData:dictItem];
                if (gameLevel) {
                    listGameLevels = [listGameLevels arrayByAddingObject:gameLevel];
                }
            }
        }
        return listGameLevels;
    }
    return nil;
}

+(CGSize)imageSize:(NSString*)imageName
{
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            return image.size;
        }
    }
    return CGSizeZero;
}

+(CGSize)getRealSize
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    float imageViewWidth = (screenSize.width - 8)/2;
    float imageViewHeight = screenSize.height - 42 -32;
    return  CGSizeMake(imageViewWidth, imageViewHeight);
}

@end

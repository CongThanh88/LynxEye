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
        return gameLevel;
        
    }
    return nil;
}

-(id)init
{
    self = [super init];
    if (self) {
        self.suggestedNumber = 0;
    }
    return self;
}

-(void)updateMarkDataWithViewSize:(CGSize)realSize
{
    //Update position
    CGSize imageSize = [GameLevel imageSize:self.leftImage];
    float ratioWidth = (realSize.width - imageSize.width)/imageSize.width;
    float ratioHeight = (realSize.height - imageSize.height)/imageSize.height;
    [self.gameData updateMarkPositionBaseOnWidthRatio:ratioWidth andHeightRatio:ratioHeight];
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

@end

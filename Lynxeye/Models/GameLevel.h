//
//  GameLevel.h
//  PicDifferent
//
//  Created by Apple on 1/9/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapImageData.h"

@interface GameLevel : NSObject
@property(nonatomic,strong)NSString *leftImage;
@property(nonatomic,strong)NSString *rightImage;
@property(nonatomic,strong)MapImageData *gameData;
+(GameLevel*)parseData:(NSDictionary*)dict;
+(NSArray*)parseListData:(NSArray*)dictArray;
@end

//
//  CheckMarkItemView.h
//  PicDifferent
//
//  Created by Apple on 1/8/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckMarkItemView : UIImageView
@property(nonatomic, assign)NSInteger itemIdex;
@property(nonatomic, assign)BOOL isChecked;

-(id)initWithFrame:(CGRect)frame;
@end

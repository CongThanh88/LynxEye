//
//  CheckMarkItemView.m
//  PicDifferent
//
//  Created by Apple on 1/8/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "CheckMarkItemView.h"

@implementation CheckMarkItemView
{
    UIImage *imgChecked;
    UIImage *imgUnChecked;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        imgChecked = [UIImage imageNamed:@"ic_checked.png"];
        imgUnChecked =[UIImage imageNamed:@"ic_unCheck.png"];
        self.image = imgUnChecked;
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgChecked = [UIImage imageNamed:@"ic_checked.png"];
        imgUnChecked =[UIImage imageNamed:@"ic_unCheck.png"];
        self.image = imgUnChecked;
    }
    return self;
}

-(void)setIsChecked:(BOOL)isChecked
{
    _isChecked = isChecked;
    if (isChecked) {
        self.image = imgChecked;
    }else{
        self.image = imgUnChecked;
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
@end

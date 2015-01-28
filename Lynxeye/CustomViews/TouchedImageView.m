//
//  TouchedImageView.m
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "TouchedImageView.h"

@implementation TouchedImageView
{
    CGSize imageSize;
    CGSize realSize;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *aTouch = [touches anyObject];
    CGPoint point = [aTouch locationInView:self];
    MarkPosition *markedPosition = [_data markedOnMapAtPosition:point];
    if (markedPosition && !markedPosition.isChecked) {
        markedPosition.isChecked = YES;
        [self drawCircleOn:[markedPosition markFrame]];
        if (_delegate && [_delegate respondsToSelector:@selector(touchedImageView:markedOnFrame:)]) {
            [_delegate touchedImageView:self markedOnFrame:[markedPosition markFrame]];
        }
    }
}

-(void)drawCircleOn:(CGRect)frame;
{
    UIImageView *checkMarkView = [[UIImageView alloc]initWithFrame:frame];
    checkMarkView.image = [UIImage imageNamed:@"ic_circle_check_mark.png"];
    [self addSubview:checkMarkView];
}

-(void)refreshView
{
    for (UIView *childView in self.subviews) {
        if (childView) {
            [childView removeFromSuperview];
        }
    }
}

-(void)resetData
{
    [_data resetMarkPosition];
}

-(void)setData:(MapImageData *)data
{
    if (data) {
        _data = data;
    }
}

-(void)suggestMart
{
    MarkPosition *suggestedPosition = [_data suggestMark];
    if (suggestedPosition) {
        <#statements#>
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

//
//  CheckMarkListView.m
//  PicDifferent
//
//  Created by Apple on 1/8/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "CheckMarkListView.h"
#import "CheckMarkItemView.h"

@implementation CheckMarkListView
{
    NSArray *listItemViews;
    NSInteger checkedNumber;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        listItemViews = [[NSArray alloc]init];
        checkedNumber = 0;
    }
    return self;
}

-(void)setCheckMarkNumber:(NSInteger)checkMarkNumber
{
    _checkMarkNumber = checkMarkNumber;
    [self setupListItemViews];
}

-(void)setupListItemViews
{
    if (_checkMarkNumber>0) {
        listItemViews = [[NSArray alloc]init];
        float margin = 3;
        float height = self.frame.size.height;
        for (int i=0; i<_checkMarkNumber; i++) {
            float position_X = i*(height+margin) + margin;
            CheckMarkItemView *itemView = [[CheckMarkItemView alloc]initWithFrame:CGRectMake(position_X, 0, height, height)];
            itemView.itemIdex = i;
            [self addSubview:itemView];
            listItemViews = [listItemViews arrayByAddingObject:itemView];
        }
    }
}

-(void)addCheckedMark
{
    if (checkedNumber < _checkMarkNumber) {
        CheckMarkItemView *itemView = [listItemViews objectAtIndex:checkedNumber];
        checkedNumber++;
        if (itemView) {
            itemView.isChecked = YES;
        }
    }
}

-(void)resetListCheckMark
{
    if (listItemViews && listItemViews.count>0) {
        for (CheckMarkItemView *itemView in listItemViews) {
            if (itemView) {
                [itemView removeFromSuperview];
            }
        }
        listItemViews = nil;
    }
    checkedNumber = 0;
}

@end

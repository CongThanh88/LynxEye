//
//  CheckMarkListView.h
//  PicDifferent
//
//  Created by Apple on 1/8/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckMarkListView : UIScrollView
@property(nonatomic,assign)NSInteger checkMarkNumber;
-(void)addCheckedMark;
-(void)resetListCheckMark;
@end

//
//  YZControlView.h
//  YZCalender
//
//  Created by hanyazhou on 14-10-20.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YZControlViewDelegate <NSObject>

- (void)goToLastMonth:(UIView *)fromView clickButton:(UIButton *)button;
- (void)goToNextMonth:(UIView *)fromView clickButton:(UIButton *)button;
- (void)choiceDate:(UIView *)fromView clickButton:(UIButton *)button;

@end

@interface YZControlView : UIView
@property (nonatomic, assign) id    <YZControlViewDelegate>   delegate;
@property (nonatomic, copy)   NSString                        *titleString;
@end

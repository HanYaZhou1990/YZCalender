//
//  YZControlView.m
//  YZCalender
//
//  Created by hanyazhou on 14-10-20.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import "YZControlView.h"

@implementation YZControlView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(10, 0, 40, 40);
    leftButton.backgroundColor = [UIColor clearColor];
    leftButton.tag = 10;
    NSString *leftImageName =[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/YZCalenderResource.bundle/Contents/Resources/arrowLeftImage.png"];
    [leftButton setBackgroundImage:[UIImage imageWithContentsOfFile:leftImageName] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftButton];
    
    
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    titleButton.frame = CGRectMake(10+40, 0, MAINWIDTH - (10+40)*2, 40);
    titleButton.backgroundColor = [UIColor clearColor];
    [titleButton setTitle:_titleString forState:UIControlStateNormal];
    [titleButton setTitleColor:UIColorFromRGB(0xfa6c90) forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    titleButton.tag = 11;
    [self addSubview:titleButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(MAINWIDTH - 10 - 40, 0, 40, 40);
    rightButton.backgroundColor = [UIColor clearColor];
    NSString *rightImageName =[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/YZCalenderResource.bundle/Contents/Resources/arrowRightImage.png"];
    [rightButton setBackgroundImage:[UIImage imageWithContentsOfFile:rightImageName] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.tag = 12;
    [self addSubview:rightButton];
}

- (void)buttonClick:(UIButton *)button{
    switch (button.tag) {
        case 10:
        {
        if ([_delegate respondsToSelector:@selector(goToLastMonth:clickButton:)]) {
            [_delegate goToLastMonth:self clickButton:button];
        }
        }
            break;
        case 11:
            if ([_delegate respondsToSelector:@selector(choiceDate:clickButton:)]) {
                [_delegate choiceDate:self clickButton:button];
            }
            break;
        case 12:
            if ([_delegate respondsToSelector:@selector(goToNextMonth:clickButton:)]) {
                [_delegate goToNextMonth:self clickButton:button];
            }
            break;
            
        default:
            break;
    }
}
@end

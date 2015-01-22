//
//  YZCalenderCell.m
//  YZCalender
//
//  Created by hanyazhou on 14-10-17.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import "YZCalenderCell.h"

@implementation YZCalenderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UIColorFromRGB(0xF0F0F0);
        self.tagArray = [NSArray array];
    }
    return self;
}

- (void)setTitleWithArray:(NSArray *)titleArray andIndex:(NSIndexPath *)myIndex viewTags:(NSArray *)myTagArray{
    NSMutableArray *mutableArray = [NSMutableArray array];
    switch ([titleArray count]/7) {
        case 4:
        {
        for (int i = 0; i < 4; i ++) {
            NSMutableArray *mutableArray1 = [NSMutableArray array];
            for (int a = 0; a < 7; a ++) {
                [mutableArray1 addObject:titleArray[a+i*7]];
            }
            [mutableArray addObject:mutableArray1];
        }
        }
            break;
        case 5:
        {
        for (int i = 0; i < 5; i ++) {
            NSMutableArray *mutableArray1 = [NSMutableArray array];
            for (int a = 0; a < 7; a ++) {
                [mutableArray1 addObject:titleArray[a+i*7]];
            }
            [mutableArray addObject:mutableArray1];
        }
        }
            break;
        case 6:
        {
        for (int i = 0; i < 6; i ++) {
            NSMutableArray *mutableArray1 = [NSMutableArray array];
            for (int a = 0; a < 7; a ++) {
                [mutableArray1 addObject:titleArray[a+i*7]];
            }
            [mutableArray addObject:mutableArray1];
        }
        }
            break;
            
        default:
            break;
    }
    _tagArray = mutableArray;
    for (int a = 0; a < [mutableArray[myIndex.row] count]; a ++) {
        YZOneDayButton *oneDayButton = [[YZOneDayButton alloc] initWithFrame:CGRectMake(6+(MAINWIDTH-10)/7*a, 0, (MAINWIDTH-18)/7, 64)];
        oneDayButton.tag = [myTagArray[a] integerValue];
        if (oneDayButton.tag < _firstDays) {
            oneDayButton.backgroundColor = [UIColor orangeColor];
            oneDayButton.userInteractionEnabled = NO;
        }else if (oneDayButton.tag > ([titleArray count]-_lastDays)){
            oneDayButton.backgroundColor = [UIColor orangeColor];
            oneDayButton.userInteractionEnabled = NO;
        }else{
            
        }
        if (oneDayButton.tag == _selectedDate) {
            oneDayButton.selected = YES;
        }else{
            oneDayButton.selected = NO;
        }
        oneDayButton.lineColor = [UIColor clearColor];
        oneDayButton.titleString = titleArray[[myTagArray[a] integerValue]];
        for (int tag = 0; tag < _travelArray.count; tag ++) {
            if ([_travelArray[tag] integerValue] == oneDayButton.tag-(_firstDays -1)) {
                oneDayButton.lineColor = UIColorFromRGB(0xA8BD44);
            }
        }
        for (int tag = 0; tag < _birthdayArray.count; tag ++) {
            if ([_birthdayArray[tag] integerValue] == oneDayButton.tag - (_firstDays -1)){
                oneDayButton.isBirthday = YES;
            }
        }
        for (int tag = 0; tag < _distanceArray.count; tag ++) {
            if ([_distanceArray[tag] integerValue] == oneDayButton.tag - (_firstDays -1)){
                oneDayButton.isDistance = YES;
            }
        }
        for (int tag = 0; tag < _dynamicArray.count; tag ++) {
            if ([_dynamicArray[tag] integerValue] == oneDayButton.tag - (_firstDays -1)){
                oneDayButton.isDynamic = YES;
            }
        }
        [oneDayButton addTarget:self action:@selector(oneDayButtonclick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:oneDayButton];
    }
}

- (void)oneDayButtonclick:(YZOneDayButton *)sender{
    NSString *string = @"";
    for (UITableViewCell *cell in [self.superview subviews]) {
        for (YZOneDayButton *oneButton in [cell.contentView subviews]) {
            if (oneButton.tag == sender.tag) {
                if (oneButton.selected == YES) {
                    if ([string isEqualToString:@"test"]) {
                    }else{
                        string = @"test";
                        oneButton.selected = YES;
                        if ([_delegate respondsToSelector:@selector(OneDayButtonClick:)]) {
                            [_delegate OneDayButtonClick:sender];
                        }
                    }
                }else{
                    if ([string isEqualToString:@"test"]) {
                    }else{
                        string = @"test";
                        oneButton.selected = YES;
                        if ([_delegate respondsToSelector:@selector(OneDayButtonClick:)]) {
                            [_delegate OneDayButtonClick:sender];
                        }
                    }
                }
            }else{
                oneButton.selected = NO;
            }
        }
    }
}

- (void)awakeFromNib{}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{[super setSelected:selected animated:animated];}

@end

@implementation YZOneDayButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (self.userInteractionEnabled == NO) {
        self.backgroundColor = UIColorFromRGB(0xF0F0F0);
    }else{
        if (selected) {
            self.backgroundColor = UIColorFromRGB(0xF9537F);
        }else{
            self.backgroundColor = UIColorFromRGB(0xF0F0F0);
        }
    }
}
- (void)layoutSubviews{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 20, 20);
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.selected = self.selected;
    [button setTitle:_titleString forState:UIControlStateNormal];
//    白色字体  ffffff   灰色字体  cacaca
    
    if (!self.userInteractionEnabled) {
        [button setTitleColor:UIColorFromRGB(0xCACACA) forState:UIControlStateNormal];
    }else{
        [button setTitleColor:UIColorFromRGB(0xFFFFFF) forState:UIControlStateSelected];
        [button setTitleColor:UIColorFromRGB(0x3D3D3D) forState:UIControlStateNormal];
    }
    button.userInteractionEnabled = NO;
    [self addSubview:button];
    
    if (_isBirthday) {
        UIButton *birthdayButton =  [UIButton buttonWithType:UIButtonTypeCustom];
        birthdayButton.frame = CGRectMake(27, 10, 10, 10);
        birthdayButton.backgroundColor = [UIColor clearColor];
        birthdayButton.titleLabel.font = [UIFont systemFontOfSize:10];
        birthdayButton.selected = self.selected;
        NSString *birthdayNormalImageName =[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/YZCalenderResource.bundle/Contents/Resources/riliBirthday.png"];
        NSString *birthdaySelectedImageName =[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/YZCalenderResource.bundle/Contents/Resources/riliBirthdayWhite.png"];
        [birthdayButton setBackgroundImage:[UIImage imageWithContentsOfFile:birthdayNormalImageName] forState:UIControlStateNormal];
        [birthdayButton setBackgroundImage:[UIImage imageWithContentsOfFile:birthdaySelectedImageName] forState:UIControlStateSelected];
        birthdayButton.userInteractionEnabled = NO;
        [self addSubview:birthdayButton];
    }else{}
    
    if (_isDistance) {
        UIButton *distanceButton =  [UIButton buttonWithType:UIButtonTypeCustom];
        distanceButton.frame = CGRectMake(27, 27, 10, 10);
        distanceButton.backgroundColor = [UIColor clearColor];
        distanceButton.selected = self.selected;
        distanceButton.titleLabel.font = [UIFont systemFontOfSize:10];
        NSString *distanceNormalImageName =[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/YZCalenderResource.bundle/Contents/Resources/riliTA.png"];
        NSString *distanceSelectedImageName =[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/YZCalenderResource.bundle/Contents/Resources/riliTAWhite.png"];
        [distanceButton setBackgroundImage:[UIImage imageWithContentsOfFile:distanceNormalImageName] forState:UIControlStateNormal];
        [distanceButton setBackgroundImage:[UIImage imageWithContentsOfFile:distanceSelectedImageName] forState:UIControlStateSelected];
        distanceButton.userInteractionEnabled = NO;
        [self addSubview:distanceButton];
    }else{}
    
    if (_isDynamic) {
        UIButton *dynamicButton =  [UIButton buttonWithType:UIButtonTypeCustom];
        dynamicButton.frame = CGRectMake(6, 27, 10, 10);
        dynamicButton.backgroundColor = [UIColor clearColor];
        dynamicButton.selected = self.selected;
        dynamicButton.titleLabel.font = [UIFont systemFontOfSize:10];
        NSString *dynamicNormalImageName =[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/YZCalenderResource.bundle/Contents/Resources/riliTrend.png"];
        NSString *dynamicSelectedImageName =[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/YZCalenderResource.bundle/Contents/Resources/riliTrendYellow.png"];
        [dynamicButton setBackgroundImage:[UIImage imageWithContentsOfFile:dynamicNormalImageName] forState:UIControlStateNormal];
        [dynamicButton setBackgroundImage:[UIImage imageWithContentsOfFile:dynamicSelectedImageName] forState:UIControlStateSelected];
        dynamicButton.userInteractionEnabled = NO;
        [self addSubview:dynamicButton];
    }else{}
    
    
    UIView *distanceView = [[UIView alloc] initWithFrame:CGRectMake(0, 55, self.frame.size.width+2, 4)];
    distanceView.backgroundColor = _lineColor;
    distanceView.userInteractionEnabled = NO;
    [self addSubview:distanceView];
}

@end

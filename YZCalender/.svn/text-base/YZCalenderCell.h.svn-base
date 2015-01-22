//
//  YZCalenderCell.h
//  YZCalender
//
//  Created by hanyazhou on 14-10-17.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZOneDayButton;

@protocol YZCalenderCellDelegate <NSObject>

- (void)OneDayButtonClick:(YZOneDayButton *)sender;

@end
@interface YZCalenderCell : UITableViewCell
@property (nonatomic, assign) id   <YZCalenderCellDelegate>     delegate;
@property (nonatomic, strong) NSArray                           *tagArray;
@property (nonatomic, strong) NSArray                           *travelArray;//行程
@property (nonatomic, strong) NSArray                           *birthdayArray;//生日
@property (nonatomic, strong) NSArray                           *distanceArray;//行程、备忘录、活动
@property (nonatomic, strong) NSArray                           *dynamicArray;//动态
@property (nonatomic, assign) NSInteger                         selectedDate;
@property (nonatomic, assign) NSInteger                         firstDays;
@property (nonatomic, assign) NSInteger                         lastDays;
- (void)setTitleWithArray:(NSArray *)titleArray andIndex:(NSIndexPath *)myIndex viewTags:(NSArray *)myTagArray;
@end

typedef struct YZRect{
    BOOL      needHidden;
    BOOL      needselecte;
}YZRect;

@interface YZOneDayButton : UIButton
@property (nonatomic, strong) UIColor          *lineColor;
@property (nonatomic, copy)   NSString         *titleString;
@property (nonatomic, assign) BOOL             isBirthday;
@property (nonatomic, assign) BOOL             isDistance;
@property (nonatomic, assign) BOOL             isDynamic;
@end
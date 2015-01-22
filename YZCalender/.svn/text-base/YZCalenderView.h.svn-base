//
//  YZCalenderView.h
//  YZCalender
//
//  Created by hanyazhou on 14-10-15.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZCalenderCell.h"
#import "YZControlView.h"

@protocol YZCalenderViewDelegate <NSObject>

@optional
- (void)oneDayButtonClicked:(YZOneDayButton *)sender
                  clickYear:(NSInteger)year
                  clikMonth:(NSInteger)month
                   clickDay:(NSInteger)day;
- (void)swipeTheCalender:(UITableView *)tableView
               swipeYear:(NSInteger)year
              swipeMonth:(NSInteger)month;

@end

@interface YZCalenderView : UIView <UITableViewDataSource,UITableViewDelegate,YZControlViewDelegate,YZCalenderCellDelegate>
@property (nonatomic, assign) id   <YZCalenderViewDelegate>     delegate;
@property (nonatomic, strong) NSDate                            *calendarDate;
@property (nonatomic, strong) NSCalendar                        *gregorian;
@property (nonatomic, assign) NSInteger                         selectedDate;
@property (nonatomic, assign) NSInteger                         selectedMonth;
@property (nonatomic, assign) NSInteger                         selectedYear;
@property (nonatomic, strong) NSMutableArray                    *allDays;//每个月开始几天（上个月）+本月天数+最后几天( 下个月)
@property (nonatomic, strong) NSMutableArray                    *firstDays;//每个月刚开始几天（上个月）
@property (nonatomic, strong) NSMutableArray                    *lastDays;//每个月最后几天（下个月）
@property (nonatomic, strong) UITableView                       *tableView;
@property (nonatomic, strong) NSArray                           *travelDays;//今天或者一个时间段内有行程
@property (nonatomic, strong) NSArray                           *birthdayDays;//需要有生日提醒标志
@property (nonatomic, strong) NSArray                           *distanceDays;//今天或者一个时间段内有行程、活动、或备忘录
@property (nonatomic, strong) NSArray                           *dynamicDays;//今天或者一个时间段内有动态

-(void)updateDate:(NSDate*)date;
@end


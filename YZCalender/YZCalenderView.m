//
//  YZCalenderView.m
//  YZCalender
//
//  Created by hanyazhou on 14-10-15.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import "YZCalenderView.h"

@implementation YZCalenderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
        swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:swipeleft];
        UISwipeGestureRecognizer * swipeRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
        swipeRight.direction=UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:swipeRight];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAINWIDTH, MAINHEIGHT-NAVIGATION_HEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 65;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = UIColorFromRGB(0xF0F0F0);
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self addSubview:_tableView];
        
        _allDays = [NSMutableArray array];
        _firstDays = [NSMutableArray array];
        _lastDays = [NSMutableArray array];
    }
    return self;
}

- (void)changeDate:(NSInteger)changeValue{
    [_allDays removeAllObjects];
    [_firstDays removeAllObjects];
    [_lastDays removeAllObjects];
    NSDateComponents *components = [self.gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
    components.day = 1;
    components.month = components.month + changeValue;
    [self updateDate:[self.gregorian dateFromComponents:components]];
    if ([_delegate respondsToSelector:@selector(swipeTheCalender:swipeYear:swipeMonth:)]) {
        [_delegate swipeTheCalender:_tableView swipeYear:_selectedYear swipeMonth:_selectedMonth];
    }
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer{
    [self changeDate:1];
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer{
    [self changeDate:-1];
}

-(void)updateDate:(NSDate*)date{
    self.calendarDate = date;
    [self allMonthDays];
    [self setCalendarParameters];
}

- (void)allMonthDays{
//    获取到具体年月日信息
    if(_gregorian == nil){
        _gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    NSDateComponents *components = [_gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
//    现在时间
    NSDateComponents *nowComponents = [[NSCalendar currentCalendar] components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:[NSDate date]];
    _selectedDate  = components.day;
    _selectedMonth = components.month;
    _selectedYear = components.year;
    if (_selectedYear == nowComponents.year && _selectedMonth == nowComponents.month) {
        _selectedDate  = nowComponents.day;
    }else{}
    
//    日历从周日开始 周日 周一。。。。。
    components.day = 2;
    NSDate *firstDayOfMonth = [_gregorian dateFromComponents:components];
    NSDateComponents *comps = [_gregorian components:NSWeekdayCalendarUnit fromDate:firstDayOfMonth];
    NSInteger weekday = [comps weekday];
    weekday  = weekday - 2;
    if(weekday < 0)
        weekday += 7;
    
    NSCalendar *c = [NSCalendar currentCalendar];
    NSRange days = [c rangeOfUnit:NSDayCalendarUnit
                           inUnit:NSMonthCalendarUnit
                          forDate:self.calendarDate];
    
    NSInteger columns = 7;
    NSInteger monthLength = days.length;
//     每个月的头几天
    components.month -=1;
    NSDate *previousMonthDate = [_gregorian dateFromComponents:components];
    NSRange previousMonthDays = [c rangeOfUnit:NSDayCalendarUnit
                                        inUnit:NSMonthCalendarUnit
                                       forDate:previousMonthDate];
    NSInteger maxDate = previousMonthDays.length - weekday;
//    每个月的天数
    for (int i = 0; i < weekday; i ++) {
        [_allDays addObject:[NSString stringWithFormat:@"%d",maxDate+i+1]];
        [_firstDays addObject:[NSString stringWithFormat:@"%d",maxDate+i+1]];
    }
    
    for (NSInteger i= 0; i<monthLength; i++){
        [_allDays addObject:[NSString stringWithFormat:@"%d",i+1]];
    }
//     每个月的后几天
    NSInteger remainingDays = (monthLength + weekday) % columns;
    if(remainingDays >0){
        for (NSInteger i = remainingDays; i < columns; i ++) {
            [_allDays addObject:[NSString stringWithFormat:@"%d",(i+1)-remainingDays]];
            [_lastDays addObject:[NSString stringWithFormat:@"%d",(i+1)-remainingDays]];
        }
    }
}

-(void)setCalendarParameters{
    if(_gregorian == nil){
        _gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [_gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
        _selectedDate  = components.day;
        _selectedMonth = components.month;
        _selectedYear = components.year;
    }
}
#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 40;
    }else{
        return 40;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        YZControlView *controlView = [[YZControlView alloc] init];
        controlView.delegate = self;
        controlView.titleString = [NSString stringWithFormat:@"%d-%d-%d",_selectedYear,_selectedMonth,_selectedDate];
        return controlView;
    }else{
        UIView *sectionTwoView = [[UIView alloc] init];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, MAINWIDTH, 20)];
        NSString *imageName =[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/YZCalenderResource.bundle/Contents/Resources/weekdays.png"];
        imageView.image = [UIImage imageWithContentsOfFile:imageName];
        [sectionTwoView addSubview:imageView];
        return sectionTwoView;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (section == 0) {
        return 0;
    }
    return [_allDays count]/7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *identifier = @"header";
    YZCalenderCell *cell = [[YZCalenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    NSAssert(_travelDays, @"如果本月没有行程，就设置一个空数组");
//    NSAssert(_birthdayDays, @"即使没有任何生日提醒，也要传一个数组过来");
//    NSAssert(_distanceDays, @"即使没有行程，活动或备忘录，也要传一个数组过来");
//    NSAssert(_dynamicDays, @"即使没有动态，也要传一个数组过来");
    cell.travelArray = _travelDays;
    cell.birthdayArray = _birthdayDays;
    cell.distanceArray = _distanceDays;
    cell.dynamicArray = _dynamicDays;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableArray *viewTagArray = [NSMutableArray array];
    for (int i = 0; i < 7; i ++) {
        [viewTagArray addObject:[NSString stringWithFormat:@"%d",indexPath.row*7+i]];
    }
    cell.firstDays = [_firstDays count];
    cell.lastDays = [_lastDays count]+1;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:[NSDate date]];
    if (_selectedYear == components.year && _selectedMonth == components.month) {
        cell.selectedDate = components.day+([_firstDays count]-1);
    }else{
        cell.selectedDate = _selectedDate+([_firstDays count]-1);
    }
    cell.delegate = self;
    [cell setTitleWithArray:_allDays andIndex:indexPath viewTags:viewTagArray];
    return cell;
}

#pragma mark -
#pragma mark YZControlViewDelegate -
- (void)goToLastMonth:(UIView *)fromView clickButton:(UIButton *)button{
    [self changeDate:-1];
}
- (void)goToNextMonth:(UIView *)fromView clickButton:(UIButton *)button{
    [self changeDate:1];    
}
- (void)choiceDate:(UIView *)fromView clickButton:(UIButton *)button{
    
}

#pragma mark -
#pragma mark OneDayButtonClick -
- (void)OneDayButtonClick:(YZOneDayButton *)sender{
    _selectedDate = [_allDays[sender.tag] integerValue];
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    if ([_delegate respondsToSelector:@selector(oneDayButtonClicked:clickYear:clikMonth:clickDay:)]) {
        [_delegate oneDayButtonClicked:sender clickYear:_selectedYear clikMonth:_selectedMonth clickDay:_selectedDate];
    }
}

@end

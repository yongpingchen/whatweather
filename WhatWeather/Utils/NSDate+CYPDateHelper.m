//
//  NSDate+CYPDateHelper.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/22/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "NSDate+CYPDateHelper.h"

@implementation NSDate (CYPDateHelper)

-(NSInteger)JSTHour
{
    NSCalendar *japanese = [[NSCalendar alloc]initWithCalendarIdentifier:NSJapaneseCalendar];
    NSDateComponents *components = [japanese components:NSUIntegerMax fromDate:self];
    return components.hour;
}

-(NSString *)JSTWeekDay
{
    NSCalendar *japanese = [[NSCalendar alloc]initWithCalendarIdentifier:NSJapaneseCalendar];
    NSDateComponents *components = [japanese components:NSWeekdayCalendarUnit fromDate:self];
    NSInteger weekday = components.weekday;
    NSLog(@"weekday int:%d",weekday);
    
    NSString *weekDateString;
    switch (weekday) {
        case 1:
            weekDateString = @"日曜日";
            break;
        case 2:
            weekDateString = @"月曜日";
            break;
        case 3:
            weekDateString = @"火曜日";
            break;
        case 4:
            weekDateString = @"水曜日";
            break;
        case 5:
            weekDateString = @"木曜日";
            break;
        case 6:
            weekDateString = @"金曜日";
            break;
        case 7:
            weekDateString = @"土曜日";
            break;
        default:
            weekDateString = @"";
            break;
    }
    
    return weekDateString;
    
}
@end

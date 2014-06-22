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
@end

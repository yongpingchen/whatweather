//
//  WeatherInfo.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "WeatherInfo.h"

@implementation WeatherInfo

-(NSArray *)next12HoursWeather
{
    if (_hourlyWeathers) {
        NSRange hoursRange = {0,12};
        return [_hourlyWeathers subarrayWithRange:hoursRange];
    }else{
        return nil;
    }
}
@end

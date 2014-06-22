//
//  WeatherInfo.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NowWeather.h"
#import "HourlyWeather.h"
#import "DailyWeather.h"

@interface WeatherInfo : NSObject

@property(nonatomic, retain)NowWeather *currentlyWeather;
@property(nonatomic, retain)NSArray *hourlyWeathers;
@property(nonatomic, retain)NSArray *dailyWeathers;

-(NSArray *)next12HoursWeather;
@end

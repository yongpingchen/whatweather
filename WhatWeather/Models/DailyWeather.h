//
//  DailyWeather.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeriodWeatherInfo.h"

@interface DailyWeather : PeriodWeatherInfo

@property(nonatomic, assign)float maxTemp;
@property(nonatomic, assign)float minTemp;

@end

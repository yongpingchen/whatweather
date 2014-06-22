//
//  DailyWeather.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "DailyWeather.h"
#import "BasicWeatherInfo.h"
//to access the private functons of supper class
@interface BasicWeatherInfo()
-(float)celiusFromFahrenheit:(float)fahrenheitTemp;
-(float)fahrenheitFromCelius:(float)celiusTemp;
@end

@implementation DailyWeather

//when setting fahrenheitTemp, triggering to convert celius temp
-(void)setMaxFahrenheitTemp:(float)maxFahrenheitTemp
{
    _maxFahrenheitTemp = maxFahrenheitTemp;
    _maxCeliusTemp = [super celiusFromFahrenheit:maxFahrenheitTemp];
}

//when setting fahrenheitTemp, triggering to convert celius temp
-(void)setMinFahrenheitTemp:(float)minFahrenheitTemp
{
    _minFahrenheitTemp = minFahrenheitTemp;
    _minCeliusTemp = [super celiusFromFahrenheit:minFahrenheitTemp];
}
@end

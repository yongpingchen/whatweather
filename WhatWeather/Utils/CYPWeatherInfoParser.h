//
//  CYPWeatherInfoParser.h
//  WhatWeather
//
//  Created by will on 14-6-21.
//  Copyright (c) 2014年 AllRoudHut. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WeatherInfo;

@interface CYPWeatherInfoParser : NSObject
+(WeatherInfo *)weatherInfoWithJsonData: (NSData *)weatherData;
@end

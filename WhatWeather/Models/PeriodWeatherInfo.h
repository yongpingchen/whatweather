//
//  PeriodWeatherInfo.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicWeatherInfo.h"

typedef NS_ENUM(NSUInteger, ForcastIOPrecipType){
    ForcastIOPrecipTypeRain,
    ForcastIOPrecipTypeSnow,
    ForcastIOPrecipTypeSleet,
    ForcastIOPrecipTypeHail
};

@interface PeriodWeatherInfo : BasicWeatherInfo

@property (nonatomic, assign)float *precipIntensity; //unit: in./hr (inches of liquid water per hour)
@property (nonatomic, assign)float *precipProbability; //A numerical value between 0 and 1 (inclusive) representing the probability of precipitation occuring at the given time.
@property (nonatomic, assign)ForcastIOPrecipType precipType; //representing the type of precipitation occurring at the given time.

@end

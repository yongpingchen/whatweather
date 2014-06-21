//
//  BasicWeatherInfo.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, ForcastIOIcon){
    ForcastIOIconClearDay,
    ForcastIOIconClearNight,
    ForcastIOIconRain,
    ForcastIOIconSnow,
    ForcastIOIconSleet,
    ForcastIOIconWind,
    ForcastIOIconFog,
    ForcastIOIconCloudy,
    ForcastIOIconPartlyCloudyDay,
    ForcastIOIconPartlyCloudyNight,
    ForcastIOIconHail,
    ForcastIOIconThunderstorm,
    ForcastIOIconTornado
};

@interface BasicWeatherInfo : NSObject

@property(nonatomic, assign)float celsiusTemp;  //celsius unit
@property(nonatomic, assign)float humidity;     //less than 1, more than 0, like 0.5
@property(nonatomic, assign)float pressure;     //mb unit
@property(nonatomic, assign)float windSpeed;    // km/h unit
@property(nonatomic, retain)NSString *weatherSummary; //a human-readable text summary of currently weather
@property(nonatomic, assign)ForcastIOIcon icon;// A machine-readable summary of this data point, suitable for selecting an icon for display.

@end

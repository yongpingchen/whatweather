//
//  CYPWeatherInfoParser.m
//  WhatWeather
//
//  Created by will on 14-6-21.
//  Copyright (c) 2014年 AllRoudHut. All rights reserved.
//

#import "CYPWeatherInfoParser.h"
#import "WeatherInfo.h"
#import "NowWeather.h"

@interface CYPWeatherInfoParser()

+(ForcastIOIcon)iconFromString:(NSString *)iconText;
+(ForcastIOPrecipType)precipTypeFromString:(NSString *)precipTypeString;
+(NSDate *)timeFromIntervalsFrom1970:(double)intervals;
@end

@implementation CYPWeatherInfoParser

+(WeatherInfo *)weatherInfoWithJsonObject: (NSDictionary *)weatherInfoDict
{
    WeatherInfo *parsedWeatherInfo;
    
    NSError *error;
    NSDictionary *jsonObject = weatherInfoDict;
    
    if (error || !jsonObject) {
        return nil;
    }
    parsedWeatherInfo = [[WeatherInfo alloc] init];
    
    NSDictionary *currentlyWeatherDict = weatherInfoDict[@"currently"];
    NSArray *dailyWeatherDicts = weatherInfoDict[@"daily"][@"data"];
    NSArray *hourlyWeatherDicts = weatherInfoDict[@"hourly"][@"data"];
    
    //parsing currently part
    if (currentlyWeatherDict) {
        NowWeather *currently = [NowWeather new];
        
        currently.time = [CYPWeatherInfoParser timeFromIntervalsFrom1970:[currentlyWeatherDict[@"time"] doubleValue]];
        currently.humidity =        [currentlyWeatherDict[@"humidity"] floatValue];
        currently.fahrenheitTemp =  [currentlyWeatherDict[@"temperature"] floatValue];
        currently.windSpeed =       [currentlyWeatherDict[@"windSpeed"] floatValue];
        currently.pressure =        [currentlyWeatherDict[@"pressure"] floatValue];
        NSString *iconText = currentlyWeatherDict[@"icon"];
        currently.icon = [CYPWeatherInfoParser iconFromString:iconText];
        
        parsedWeatherInfo.currentlyWeather = currently;
        
    }
    
    //parsing hourly part
    NSMutableArray *hourlyWeathers = [NSMutableArray new];
    for (NSDictionary *hourlyWeatherDic in hourlyWeatherDicts) {
        HourlyWeather *hourlyWeather = [HourlyWeather new];
        //parsing the basic part
        hourlyWeather.time = [CYPWeatherInfoParser timeFromIntervalsFrom1970:[hourlyWeatherDic[@"time"] doubleValue]];
        hourlyWeather.humidity =        [hourlyWeatherDic[@"humidity"] floatValue];
        hourlyWeather.fahrenheitTemp =  [hourlyWeatherDic[@"temperature"] floatValue];
        hourlyWeather.windSpeed =       [hourlyWeatherDic[@"windSpeed"] floatValue];
        hourlyWeather.pressure =        [hourlyWeatherDic[@"pressure"] floatValue];
        NSString *iconText =            hourlyWeatherDic[@"icon"];
        hourlyWeather.icon =            [CYPWeatherInfoParser iconFromString:iconText];
        
        //parsing the parts of period info
        hourlyWeather.precipIntensity = [hourlyWeatherDic[@"precipIntensity"] floatValue];
        hourlyWeather.precipProbability = [hourlyWeatherDic[@"precipProbability"] floatValue];
        
        NSString *precipTypeString = hourlyWeatherDic[@"precipType"];
        hourlyWeather.precipType = [CYPWeatherInfoParser precipTypeFromString:precipTypeString];
        
        [hourlyWeathers addObject:hourlyWeather];
        
    }
    parsedWeatherInfo.hourlyWeathers = [hourlyWeathers copy];
    
    //parsing daily part
    NSMutableArray *dailyWeathers = [NSMutableArray new];
    for (NSDictionary *dailyWeatherDict in dailyWeatherDicts) {
        DailyWeather *dailyWeather = [DailyWeather new];
        //parsing the basic part
        dailyWeather.time = [CYPWeatherInfoParser timeFromIntervalsFrom1970:[dailyWeatherDict[@"time"] doubleValue]];
        dailyWeather.humidity =         [dailyWeatherDict[@"humidity"] floatValue];
        dailyWeather.fahrenheitTemp =   [dailyWeatherDict[@"temperature"] floatValue];
        dailyWeather.windSpeed =        [dailyWeatherDict[@"windSpeed"] floatValue];
        dailyWeather.pressure =         [dailyWeatherDict[@"pressure"] floatValue];
        NSString *iconText =            dailyWeatherDict[@"icon"];
        dailyWeather.icon =             [CYPWeatherInfoParser iconFromString:iconText];
        
        //parse daily part
        dailyWeather.maxFahrenheitTemp = [dailyWeatherDict[@"temperatureMax"] floatValue];
        dailyWeather.minFahrenheitTemp = [dailyWeatherDict[@"temperatureMin"] floatValue];
        
        [dailyWeathers addObject:dailyWeather];
    }
    parsedWeatherInfo.dailyWeathers = [dailyWeathers copy];
    
    
    return parsedWeatherInfo;
}

+(ForcastIOIcon)iconFromString:(NSString *)iconText
{
    ForcastIOIcon parsedIcon;
    //clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night,hail,thunderstorm,tornado
    if ([iconText isEqualToString:@"clear-day"]) {
        parsedIcon = ForcastIOIconClearDay;
    }else if ([iconText isEqualToString:@"clear-night"]){
        parsedIcon = ForcastIOIconClearNight;
    }else if ([iconText isEqualToString:@"rain"]){
        parsedIcon = ForcastIOIconRain;
    }else if ([iconText isEqualToString:@"snow"]){
        parsedIcon = ForcastIOIconSnow;
    }else if ([iconText isEqualToString:@"sleet"]){
        parsedIcon = ForcastIOIconSleet;
    }else if ([iconText isEqualToString:@"wind"]){
        parsedIcon = ForcastIOIconWind;
    }else if ([iconText isEqualToString:@"fog"]){
        parsedIcon = ForcastIOIconFog;
    }else if ([iconText isEqualToString:@"cloudy"]){
        parsedIcon = ForcastIOIconCloudy;
    }else if ([iconText isEqualToString:@"partly-cloudy-day"]){
        parsedIcon = ForcastIOIconPartlyCloudyDay;
    }else if ([iconText isEqualToString:@"partly-cloudy-night"]){
        parsedIcon = ForcastIOIconPartlyCloudyNight;
    }else if ([iconText isEqualToString:@"hail"]){
        parsedIcon = ForcastIOIconHail;
    }else if ([iconText isEqualToString:@"thunderstorm"]){
        parsedIcon = ForcastIOIconThunderstorm;
    }else if ([iconText isEqualToString:@"tornado"]){
        parsedIcon = ForcastIOIconTornado;
    }else{
        parsedIcon = ForcastIOIconUndefine;
    }
    
    return parsedIcon;
}

+(ForcastIOPrecipType)precipTypeFromString:(NSString *)precipTypeString
{
    ForcastIOPrecipType precipType;
    //rain, snow, sleet,hail
    if ([precipTypeString isEqualToString:@"rain"]) {
        precipType = ForcastIOPrecipTypeRain;
    }else if ([precipTypeString isEqualToString:@"snow"]){
        precipType = ForcastIOPrecipTypeSnow;
    }else if ([precipTypeString isEqualToString:@"sleet"]){
        precipType = ForcastIOPrecipTypeSleet;
    }else if ([precipTypeString isEqualToString:@"hail"]){
        precipType = ForcastIOPrecipTypeHail;
    }else{
        precipType = ForcastIOPrecipTypeUndefine;
    }
    return precipType;
}

+(NSDate *)timeFromIntervalsFrom1970:(double)intervals
{
    return [NSDate dateWithTimeIntervalSince1970:intervals];
}
@end












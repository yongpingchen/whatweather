//
//  BasicWeatherInfo.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "BasicWeatherInfo.h"
#import "CYPIconImage.h"
@interface BasicWeatherInfo()

@property(nonatomic, assign, readwrite)UIImage *iconImage;

-(float)celiusFromFahrenheit:(float)fahrenheitTemp;
-(float)fahrenheitFromCelius:(float)celiusTemp;
@end

@implementation BasicWeatherInfo
//when setting fahrenheitTemp, triggering to convert celius temp
-(void)setFahrenheitTemp:(float)fahrenheitTemp
{
    _fahrenheitTemp = fahrenheitTemp;
    //convert to celius temp
    _celiusTemp = [self celiusFromFahrenheit:fahrenheitTemp];
}

//when setting fahrenheitTemp, triggering to convert celius temp
-(void)setCeliusTemp:(float)celiusTemp
{
    _celiusTemp = celiusTemp;
    //convert to fahrenheit temp
    _fahrenheitTemp = [self fahrenheitFromCelius:celiusTemp];
}

-(void)setIcon:(ForcastIOIcon)icon
{
    _icon = icon;
    _iconImage = [CYPIconImage imageWithIconType:icon];
}

#pragma mark convertion functions
-(float)celiusFromFahrenheit:(float)fahrenheitTemp
{
    return (fahrenheitTemp-32)* 5/9;
}
-(float)fahrenheitFromCelius:(float)celiusTemp
{
    return celiusTemp*9/5+32;
}
@end

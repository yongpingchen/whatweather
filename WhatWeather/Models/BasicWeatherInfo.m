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
@end

@implementation BasicWeatherInfo
-(void)setFahrenheitTemp:(float)fahrenheitTemp
{
    _fahrenheitTemp = fahrenheitTemp;
    //convert to celius temp
    _celiusTemp = (_fahrenheitTemp-32)* 5/9;
}

-(void)setCeliusTemp:(float)celiusTemp
{
    _celiusTemp = celiusTemp;
    //convert to fahrenheit temp
    _fahrenheitTemp = _celiusTemp*9/5+32;
}

-(void)setIcon:(ForcastIOIcon)icon
{
    _icon = icon;
    _iconImage = [CYPIconImage imageWithIconType:icon];
}
@end

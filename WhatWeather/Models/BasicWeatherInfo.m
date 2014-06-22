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

-(void)setIcon:(ForcastIOIcon)icon
{
    _icon = icon;
    _iconImage = [CYPIconImage imageWithIconType:icon];
}
@end

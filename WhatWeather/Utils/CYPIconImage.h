//
//  CYPIconImage.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/22/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherTypesSharedHeader.h"

@interface CYPIconImage : NSObject
+(UIImage *)imageWithIconType:(ForcastIOIcon)iconType;

@end

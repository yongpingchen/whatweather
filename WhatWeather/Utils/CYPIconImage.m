//
//  CYPIconImage.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/22/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "CYPIconImage.h"

@implementation CYPIconImage

+(UIImage *)imageWithIconType:(ForcastIOIcon)iconType
{
    NSString *imageName;
    switch (iconType) {
        case ForcastIOIconClearDay:
            imageName = @"Sun";
            break;
        case ForcastIOIconClearNight:
            imageName = @"moon";
            break;
        case ForcastIOIconRain:
            imageName = @"rain";
            break;
        case ForcastIOIconSnow:
            imageName = @"snow";
            break;
        case ForcastIOIconSleet:
            imageName = @"sleet";
            break;
        case ForcastIOIconWind:
            imageName = @"wind";
            break;
        case ForcastIOIconFog:
            imageName = @"fog";
            break;
        case ForcastIOIconCloudy:
            imageName = @"cloud";
            break;
        case ForcastIOIconPartlyCloudyDay:
            imageName = @"cloud+sun";
            break;
        case ForcastIOIconPartlyCloudyNight:
            imageName = @"cloud+moon";
            break;
        case ForcastIOIconHail:
            imageName = @"hail";
            break;
        case ForcastIOIconThunderstorm:
            imageName = @"lightning";
            break;
        case ForcastIOIconTornado:
            imageName = @"hurricane";
            break;
        case ForcastIOIconUndefine:
            imageName = @"undefine";
            break;
            
        default:
            break;
    }
    if (imageName) {
        return [UIImage imageNamed:imageName];
    }else{
        return nil;
    }
}
@end

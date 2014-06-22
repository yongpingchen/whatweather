//
//  WeatherTypesSharedHeader.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/22/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#ifndef WhatWeather_WeatherTypesSharedHeader_h
#define WhatWeather_WeatherTypesSharedHeader_h

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
    ForcastIOIconTornado,
    ForcastIOIconUndefine
};

typedef NS_ENUM(NSUInteger, ForcastIOPrecipType){
    ForcastIOPrecipTypeRain,
    ForcastIOPrecipTypeSnow,
    ForcastIOPrecipTypeSleet,
    ForcastIOPrecipTypeHail,
    ForcastIOPrecipTypeUndefine
};
#endif

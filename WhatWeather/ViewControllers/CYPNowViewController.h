//
//  CYPNowViewController.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BasicWeatherInfo;

@interface CYPNowViewController : UIViewController

@property(nonatomic, retain)BasicWeatherInfo *basicInfo;
@property(nonatomic, retain)NSString *cityName;
@end

//
//  CYPDailyWeatherTableViewCell.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/22/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYPDailyWeatherTableViewCell : UITableViewCell

@property(nonatomic,retain)IBOutlet UILabel     *dayLabel;
@property(nonatomic,retain)IBOutlet UIImageView *iconImageView;
@property(nonatomic,retain)IBOutlet UILabel     *maxTempLabel;
@property(nonatomic,retain)IBOutlet UILabel     *minTempLabel;

@end

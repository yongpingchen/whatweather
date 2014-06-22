//
//  CYPHourlyWeatherCollectionCell.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/22/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYPHourlyWeatherCollectionCell : UICollectionViewCell

@property(nonatomic,retain)IBOutlet UILabel     *timeLabel;
@property(nonatomic,retain)IBOutlet UIImageView *iconImageView;
@property(nonatomic,retain)IBOutlet UILabel     *tempLabel;

@end

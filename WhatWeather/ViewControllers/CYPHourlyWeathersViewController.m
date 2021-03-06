//
//  CYPHourlyWeathersViewController.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/22/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "CYPHourlyWeathersViewController.h"
#import "CYPHourlyWeatherCollectionCell.h"
#import "HourlyWeather.h"
#import "NSDate+CYPDateHelper.h"

@interface CYPHourlyWeathersViewController ()

@end

@implementation CYPHourlyWeathersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//overide setter to reload the collection view whenever hourly weather is refresh
-(void)setHourlyWeathers:(NSArray *)hourlyWeathers
{
    _hourlyWeathers = hourlyWeathers;
    [self.collectionView reloadData];
}

#pragma mark - collection data source delegate methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    if (_hourlyWeathers) {
        return _hourlyWeathers.count;
    }else{
        return 0;
    }
}

#pragma mark - collection view delegate methods

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CYPHourlyWeatherCollectionCell *cell = (CYPHourlyWeatherCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HourlyWeatherCell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[CYPHourlyWeatherCollectionCell alloc] init];
    }
    HourlyWeather *hourlyWeather = _hourlyWeathers[indexPath.row];
    
    //get hour from time
    cell.timeLabel.text = [NSString stringWithFormat:@"%d時",hourlyWeather.time.JSTHour];
    cell.iconImageView.image = hourlyWeather.iconImage;
    cell.tempLabel.text = [NSString stringWithFormat:@"%.0f",hourlyWeather.celiusTemp];
    
    
    return cell;
    
}


@end

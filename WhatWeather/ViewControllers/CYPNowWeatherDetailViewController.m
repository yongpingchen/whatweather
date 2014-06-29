//
//  CYPNowWeatherDetailViewController.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/22/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "CYPNowWeatherDetailViewController.h"
#import "BasicWeatherInfo.h"

@interface CYPNowWeatherDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *humidityValueLable;
@property (weak, nonatomic) IBOutlet UILabel *pressureValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedValueLabel;

@end

@implementation CYPNowWeatherDetailViewController

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

-(void)setBasicInfo:(BasicWeatherInfo *)basicInfo
{
    _humidityValueLable.text = [NSString stringWithFormat:@"%.0f %@",basicInfo.humidity*100, @"%"];
    _pressureValueLabel.text = [NSString stringWithFormat:@"%.0f mb", basicInfo.pressure];
    _windSpeedValueLabel.text = [NSString stringWithFormat:@"%.2f km/h",basicInfo.windSpeed];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

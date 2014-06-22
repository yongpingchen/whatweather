//
//  CYPNowViewController.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "CYPNowViewController.h"
#import "BasicWeatherInfo.h"

@interface CYPNowViewController ()
{

}
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation CYPNowViewController

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
    _temperatureLabel.text = [NSString stringWithFormat:@"%.0f",basicInfo.fahrenheitTemp];
    _iconImageView.image = basicInfo.iconImage;
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

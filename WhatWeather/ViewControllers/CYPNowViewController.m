//
//  CYPNowViewController.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "CYPNowViewController.h"
#import "CYPNowWeatherChildViewController.h"
#import "CYPNowWeatherBriefViewController.h"
#import "CYPNowWeatherDetailViewController.h"

@interface CYPNowViewController ()
{
    CYPNowWeatherChildViewController *childViewController;

}

@property (weak, nonatomic) IBOutlet UILabel *addressNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *briefDetailButton;
@property (weak, nonatomic) IBOutlet UIView *contentView;

- (IBAction)tapBriefDetailButton:(id)sender;

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
    for (UIViewController *viewController in self.childViewControllers) {
        if ([viewController isKindOfClass:[CYPNowWeatherChildViewController class]]) {
            childViewController = (CYPNowWeatherChildViewController *)viewController;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setBasicInfo:(BasicWeatherInfo *)basicInfo
{
    _basicInfo = basicInfo;
    
    if (childViewController) {
        childViewController.basicInfo = basicInfo;
    }
}
-(void)setCityName:(NSString *)cityName
{
    _cityName = cityName;
    _addressNameLabel.text = cityName;
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


- (IBAction)tapBriefDetailButton:(id)sender {
    if ([_briefDetailButton.titleLabel.text isEqualToString:@"+"]) {
        
        [_briefDetailButton setTitle:@"-" forState:UIControlStateNormal];
        CYPNowWeatherDetailViewController *weatherDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CYPNowWeatherDetailViewController"];
        childViewController = weatherDetailViewController;
        
    }else{
        [_briefDetailButton setTitle:@"+" forState:UIControlStateNormal];
        CYPNowWeatherBriefViewController *weatherBriefViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CYPNowWeatherBriefViewController"];
        childViewController = weatherBriefViewController;
    }
    
    [_contentView addSubview:childViewController.view];
    childViewController.basicInfo = _basicInfo;


}
@end

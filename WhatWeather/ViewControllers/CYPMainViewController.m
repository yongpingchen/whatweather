//
//  CYPMainViewController.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "CYPMainViewController.h"
#import "CYPForcastIOManager.h"
#import "CYPWeatherInfoParser.h"
#import <CoreLocation/CoreLocation.h>
#import "CYPNowViewController.h"
#import "CYPWeeklyTableViewController.h"
#import "CYPTodayViewController.h"

#import "WeatherInfo.h"


@interface CYPMainViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager   *locationManager;
    CLLocation          *currentLocation;
    
    CYPNowViewController *currentlyViewController;
    CYPTodayViewController *todayViewController;
    CYPWeeklyTableViewController *weeklyViewController;
}
@end

@implementation CYPMainViewController

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
    
    //start to get current location
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    //init the child view controllers
    for (UIViewController *childContrller in self.childViewControllers) {
        if ([childContrller isKindOfClass:[CYPNowViewController class]]) {
            
            currentlyViewController = (CYPNowViewController *)childContrller;
            
        }else if([childContrller isKindOfClass:[CYPTodayViewController class]]){
            
            todayViewController = (CYPTodayViewController *)childContrller;
            
        }else if([childContrller isKindOfClass:[CYPWeeklyTableViewController class]]){
            
            weeklyViewController = (CYPWeeklyTableViewController *)childContrller;
            
        }else{
            NSLog(@"other view controller");
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - CLLocationManagerDelegate methods
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%d locations returned, the first one: %@", locations.count, locations[0]);
    CLLocation *firstLocation = locations[0];
    
    if (!currentLocation) {
        currentLocation = firstLocation;
        [[CYPForcastIOManager sharedManager] forcastRequestWithLongitude:[NSNumber numberWithFloat:currentLocation.coordinate.longitude]
                                                                latitude:[NSNumber numberWithFloat:currentLocation.coordinate.latitude]
                                                           FinishedBlock:^(id response) {
                                                               WeatherInfo *parsedInfo = [CYPWeatherInfoParser weatherInfoWithJsonObject:response];
                                                               currentlyViewController.basicInfo = parsedInfo.currentlyWeather;
                                                           }
                                                             failedBlock:^(NSError *error) {
                                                                 NSLog(@"error:%@",error.description);
                                                                 
                                                             }];
    }
    [locationManager stopUpdatingLocation];
    
}

#pragma mark update child views





@end

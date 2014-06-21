//
//  CYPForcastIOManager.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "CYPForcastIOManager.h"
#import <AFNetworking/AFNetworking.h>

@interface CYPForcastIOManager()

@property (nonatomic, retain) NSString *apiKey;
@property (nonatomic, retain) NSString *forcastBasicURL;
@end

@implementation CYPForcastIOManager

//implement the method for returning singleton
+(id)sharedManager
{
    static CYPForcastIOManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        sharedManager.apiKey = @"e4e16728cc706d98e06f30e831e20467";
        sharedManager.forcastBasicURL = [NSString stringWithFormat:@"%@/%@", @"https://api.forecast.io/forecast", sharedManager.apiKey];
    });
    
    return sharedManager;
}

-(void)forcastRequestWithLongitude:(NSNumber *)longitude latitude:(NSNumber *)latitude FinishedBlock:(CYPForcastIORequestFinishBlock)finishedBlock failedBlock:(CYPForcastIORequestFailedBlock)failedBlock
{
    NSString *requestURLString = [NSString stringWithFormat:@"%@/%f,%f",_forcastBasicURL,latitude.floatValue, longitude.floatValue];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:requestURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        finishedBlock(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failedBlock(error);
    }];
}


@end

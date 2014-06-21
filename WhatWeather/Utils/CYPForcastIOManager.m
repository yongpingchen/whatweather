//
//  CYPForcastIOManager.m
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import "CYPForcastIOManager.h"
@interface CYPForcastIOManager()
{
    NSString *apiKey;
    
}
@end

@implementation CYPForcastIOManager

//implement the method for returning singleton
+(id)sharedManager
{
    static CYPForcastIOManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        
    });
    
    return sharedManager;
}


@end

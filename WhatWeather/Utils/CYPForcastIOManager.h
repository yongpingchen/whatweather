//
//  CYPForcastIOManager.h
//  WhatWeather
//
//  Created by Chen Yongping on 6/21/14.
//  Copyright (c) 2014 AllRoudHut. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CYPForcastIORequestFinishBlock) (id response);
typedef void(^CYPForcastIORequestFailedBlock) (NSError *error);


@interface CYPForcastIOManager : NSObject

+(id) sharedManager;

-(void)forcastRequestWithLongitude:(NSNumber *)longitude latitude:(NSNumber *)latitude FinishedBlock:(CYPForcastIORequestFinishBlock) finishedBlock failedBlock:(CYPForcastIORequestFailedBlock)failedBlock;

@end

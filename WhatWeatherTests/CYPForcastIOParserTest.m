//
//  CYPForcastIOParserTest.m
//  WhatWeather
//
//  Created by will on 14-7-3.
//  Copyright (c) 2014年 AllRoudHut. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CYPWeatherInfoParser.h"

@interface CYPForcastIOParserTest : XCTestCase
{
    NSDictionary *weatherInfoDict;
}

@end

@implementation CYPForcastIOParserTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSData *fileDataForTesting = [[NSFileManager defaultManager] contentsAtPath:@"weatherinfo.json"];
    weatherInfoDict = [NSJSONSerialization JSONObjectWithData:fileDataForTesting options:NSJSONReadingAllowFragments error:nil];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFileDict
{
    XCTAssertNotNil(weatherInfoDict, @"the test data is empty");
}

@end

//
//  CYPForcastIOParserTest.m
//  WhatWeather
//
//  Created by will on 14-7-3.
//  Copyright (c) 2014年 AllRoudHut. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CYPWeatherInfoParser.h"
#import "WeatherInfo.h"
#import "NowWeather.h"

@interface CYPForcastIOParserTest : XCTestCase
{
    NSDictionary *weatherInfoDict;
    WeatherInfo *parsedWeather;
}

@end

@implementation CYPForcastIOParserTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSBundle *testBundle=[NSBundle bundleForClass:[self class]];
    NSString *filePath = [testBundle pathForResource:@"weatherinfo" ofType:@"json"];//[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"weatherinfo.json"];
    NSData *fileDataForTesting = [[NSFileManager defaultManager] contentsAtPath:filePath];
    weatherInfoDict = [NSJSONSerialization JSONObjectWithData:fileDataForTesting options:NSJSONReadingAllowFragments error:nil];
    parsedWeather = [CYPWeatherInfoParser weatherInfoWithJsonObject:weatherInfoDict];
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

-(void)testParserResult
{

    XCTAssertNotNil(parsedWeather, @"parsed weather info should not be nil");
}

-(void)testNowWeather
{
    XCTAssertEqual(parsedWeather.currentlyWeather.pressure
                   , 1012.25, @"currently pressure should be correctly");
    
}


@end

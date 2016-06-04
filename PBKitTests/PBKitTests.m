//
//  PBKitTests.m
//  PBKitTests
//
//  Created by pebble8888 on 2015/05/03.
//  Copyright (c) 2015 pebble8888. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PBDateTime.h"

@interface PBKitTests : XCTestCase

@end

@implementation PBKitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    NSString* str = [[PBDateTime formatter] stringFromDate:[NSDate date]];
    NSLog(@"%@", str);
    
    PBDateTime* dt = [PBDateTime pbdatetimeWithDateString:@"2016-02-01T01:00:00.000+0900"];
    NSLog(@"%@", dt.date);
    XCTAssert(dt.date != nil);
}

@end

//
//  NSString+PBUtils_Tests.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/09.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest

class NSStringPBUtilsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testExample1() {
        let str: String = "hoge@gmail.com".deletedTrailingAtMark()
        XCTAssertEqual(str, "hoge")
    }
    
}

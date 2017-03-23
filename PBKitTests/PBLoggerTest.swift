//
//  PBLoggerTest.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/06.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest
#if os(iOS)
#else
@testable import PBKit_macOS
#endif

class PBLoggerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        debug_log("hoge1")
        debug_log("fuga1")
    }
}

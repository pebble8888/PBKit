//
//  NSString+PBBase64_Tests.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/09.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest

class NSStringPBBase64Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPBExtension() {
        let a1 = "ab?cd~".base64UrlSafe()
        XCTAssertEqual(a1, "YWI_Y2R-")

        let a2 = "ab?cd~e".base64UrlSafe()
        XCTAssertEqual(a2, "YWI_Y2R-ZQ==")
        
        let a3 = "ab?cd~e".base64UrlSafeNoEqual()
        XCTAssertEqual(a3, "YWI_Y2R-ZQ")

        let a4 = "あいう".base64UrlSafe()
        XCTAssertEqual(a4, "44GC44GE44GG")
    }
    
    func testNative() {
        let a1 = "ab?cd~".base64()
        XCTAssertEqual(a1, "YWI/Y2R+")

        let a2 = "あいう".base64()
        XCTAssertEqual(a2, "44GC44GE44GG")
    }
}

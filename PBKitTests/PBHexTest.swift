//
//  PBHexTest.swift
//  PBKit
//
//  Created by pebble8888 on 2017/06/10.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest
import PBKit

class PBHexTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test1() {
        let v:[UInt8] = [10,11,12]
        XCTAssertEqual(v.hexDescription(), "0a0b0c")
    }
    
    func testData() {
        let s = "abc"
        guard let d = s.data(using: .utf8) else { return XCTFail() }
        XCTAssertEqual(d.hexDescription(), "616263")
    }
    
    
}

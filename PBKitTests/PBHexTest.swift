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

    func testData() {
        let s = "abc"
        guard let d = s.data(using: .utf8) else { return XCTFail() }
        XCTAssertEqual(d.hexDescription(), "616263")
    }

    func test2() {
        let a:UInt8 = 10
        XCTAssertEqual(a.hexDescription(), "0a")
        
        let b: Int32 = 10
        XCTAssertEqual(b.hexDescription(), "0000000a")

        let v: [UInt8] = [10, 11, 12]
        XCTAssertEqual(v.hexDescription(), "0a0b0c")

        let data: Data = Data(bytes: [11, 12, 13])
        XCTAssertEqual(data.hexDescription(), "0b0c0d")
    }
}

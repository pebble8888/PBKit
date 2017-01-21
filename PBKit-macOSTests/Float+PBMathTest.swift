//
//  Float+PBMathTest.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/21.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest
import PBKit_macOS 

class Float_PBMathTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFloatNealy() {
        XCTAssert( isNealyInteger(val: 10.0))
        XCTAssert( isNealyInteger(val: 10.000000000000000000001))
        XCTAssert( isNealyInteger(val: 10.00000000000000000001))
        XCTAssert( isNealyInteger(val: 10.0000000000000000001))
        XCTAssert( isNealyInteger(val: 10.000000000000000001))
        XCTAssert( isNealyInteger(val: 10.00000000000000001))
        XCTAssert( isNealyInteger(val: 10.0000000000000001))
        XCTAssert(!isNealyInteger(val: 10.000000000000001))
        XCTAssert(!isNealyInteger(val: 10.00000000000001))
        XCTAssert(!isNealyInteger(val: 10.0000000000001))
        XCTAssert(!isNealyInteger(val: 10.000000000001))
        XCTAssert(!isNealyInteger(val: 10.00000000001))
        XCTAssert(!isNealyInteger(val: 10.0000000001))
        XCTAssert(!isNealyInteger(val: 10.000000001))
        XCTAssert(!isNealyInteger(val: 10.00000001))
        XCTAssert(!isNealyInteger(val: 10.0000001))
        XCTAssert(!isNealyInteger(val: 10.000001))
        XCTAssert(!isNealyInteger(val: 10.00001))
        XCTAssert(!isNealyInteger(val: 10.0001))
        XCTAssert(!isNealyInteger(val: 10.001))
        XCTAssert(!isNealyInteger(val: 10.01))
        XCTAssert(!isNealyInteger(val: 10.1))
    }
    
    func testFloat() {
        XCTAssert(Float(10.0) == Float(10.0))
        XCTAssert(Float(10.0) == Float(10.000000000000000000001))
        XCTAssert(Float(10.0) == Float(10.00000000000000000001))
        XCTAssert(Float(10.0) == Float(10.0000000000000000001))
        XCTAssert(Float(10.0) == Float(10.000000000000000001))
        XCTAssert(Float(10.0) == Float(10.00000000000000001))
        XCTAssert(Float(10.0) == Float(10.0000000000000001))
        XCTAssert(Float(10.0) == Float(10.000000000000001))
        XCTAssert(Float(10.0) == Float(10.00000000000001))
        XCTAssert(Float(10.0) == Float(10.0000000000001))
        XCTAssert(Float(10.0) == Float(10.000000000001))
        XCTAssert(Float(10.0) == Float(10.00000000001))
        XCTAssert(Float(10.0) == Float(10.0000000001))
        XCTAssert(Float(10.0) == Float(10.000000001))
        XCTAssert(Float(10.0) == Float(10.00000001))
        XCTAssert(Float(10.0) == Float(10.0000001))
        XCTAssert(Float(10.0) != Float(10.000001))
        XCTAssert(Float(10.0) != Float(10.00001))
        XCTAssert(Float(10.0) != Float(10.0001))
        XCTAssert(Float(10.0) != Float(10.001))
        XCTAssert(Float(10.0) != Float(10.01))
        XCTAssert(Float(10.0) != Float(10.1))
    }
    
    func testDouble() {
        XCTAssert(Double(10.0) == Double(10.0))
        XCTAssert(Double(10.0) == Double(10.000000000000000000001))
        XCTAssert(Double(10.0) == Double(10.00000000000000000001))
        XCTAssert(Double(10.0) == Double(10.0000000000000000001))
        XCTAssert(Double(10.0) == Double(10.000000000000000001))
        XCTAssert(Double(10.0) == Double(10.00000000000000001))
        XCTAssert(Double(10.0) == Double(10.0000000000000001))
        XCTAssert(Double(10.0) != Double(10.000000000000001))
        XCTAssert(Double(10.0) != Double(10.00000000000001))
        XCTAssert(Double(10.0) != Double(10.0000000000001))
        XCTAssert(Double(10.0) != Double(10.000000000001))
        XCTAssert(Double(10.0) != Double(10.00000000001))
        XCTAssert(Double(10.0) != Double(10.0000000001))
        XCTAssert(Double(10.0) != Double(10.000000001))
        XCTAssert(Double(10.0) != Double(10.00000001))
        XCTAssert(Double(10.0) != Double(10.0000001))
        XCTAssert(Double(10.0) != Double(10.000001))
        XCTAssert(Double(10.0) != Double(10.00001))
        XCTAssert(Double(10.0) != Double(10.0001))
        XCTAssert(Double(10.0) != Double(10.001))
        XCTAssert(Double(10.0) != Double(10.01))
        XCTAssert(Double(10.0) != Double(10.1))
    }
    
    
}

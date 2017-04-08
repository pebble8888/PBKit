//
//  PBByteFormatterTests.swift
//  PBKit
//
//  Created by pebble8888 on 2017/04/08.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest
#if os(iOS)
    @testable import PBKit
#else
    @testable import PBKit_macOS
#endif 

class PBByteFormatterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_digit() {
        XCTAssertEqual(PBByteCountFormatter.ten_digit(0), 1)
        XCTAssertEqual(PBByteCountFormatter.ten_digit(1), 1)
        XCTAssertEqual(PBByteCountFormatter.ten_digit(12), 2)
        XCTAssertEqual(PBByteCountFormatter.ten_digit(123), 3)
        XCTAssertEqual(PBByteCountFormatter.ten_digit(1234), 4)
    }
    
    func test1() {
        /* default ByteCountFormatter */
        /*
        XCTAssertEqual(Int64(0).byteCountRepresentation, "Zero KB")
        
        XCTAssertEqual(Int64(1).byteCountRepresentation, "1 byte")
        XCTAssertEqual(Int64(12).byteCountRepresentation, "12 bytes")
        XCTAssertEqual(Int64(123).byteCountRepresentation, "123 bytes")
        
        XCTAssertEqual(Int64(1_234).byteCountRepresentation, "1 KB")
        XCTAssertEqual(Int64(12_345).byteCountRepresentation, "12 KB")
        XCTAssertEqual(Int64(123_456).byteCountRepresentation, "123 KB")
        
        XCTAssertEqual(Int64(1_234_567).byteCountRepresentation, "1.2 MB")
        XCTAssertEqual(Int64(12_345_678).byteCountRepresentation, "12.3 MB")
        XCTAssertEqual(Int64(123_456_789).byteCountRepresentation, "123.5 MB")
        
        XCTAssertEqual(Int64(1_234_567_891).byteCountRepresentation, "1.23 GB")
        XCTAssertEqual(Int64(1_034_567_891).byteCountRepresentation, "1.03 GB")
        XCTAssertEqual(Int64(1_204_567_891).byteCountRepresentation, "1.2 GB")
        XCTAssertEqual(Int64(1_230_567_891).byteCountRepresentation, "1.23 GB")
        
        XCTAssertEqual(Int64(12_345_678_912).byteCountRepresentation, "12.35 GB")
        XCTAssertEqual(Int64(10_345_678_912).byteCountRepresentation, "10.35 GB")
        XCTAssertEqual(Int64(12_045_678_912).byteCountRepresentation, "12.05 GB")
         */
        
        XCTAssertEqual(Int64(0).byteCountRepresentation, "0 B")
        
        XCTAssertEqual(Int64(1).byteCountRepresentation, "1 KB")
        XCTAssertEqual(Int64(12).byteCountRepresentation, "1 KB")
        XCTAssertEqual(Int64(123).byteCountRepresentation, "1 KB")
        
        XCTAssertEqual(Int64(1_234).byteCountRepresentation, "1 KB")
        XCTAssertEqual(Int64(12_345).byteCountRepresentation, "12 KB")
        XCTAssertEqual(Int64(123_456).byteCountRepresentation, "123 KB")
        
        XCTAssertEqual(Int64(1_234_567).byteCountRepresentation, "1 MB")
        XCTAssertEqual(Int64(12_345_678).byteCountRepresentation, "12 MB")
        XCTAssertEqual(Int64(123_456_789).byteCountRepresentation, "123 MB")
        
        XCTAssertEqual(Int64(1_234_567_891).byteCountRepresentation, "1.23 GB")
        XCTAssertEqual(Int64(1_034_567_891).byteCountRepresentation, "1.03 GB")
        XCTAssertEqual(Int64(1_204_567_891).byteCountRepresentation, "1.20 GB")
        XCTAssertEqual(Int64(1_230_567_891).byteCountRepresentation, "1.23 GB")
        
        XCTAssertEqual(Int64(12_345_678_912).byteCountRepresentation, "12.3 GB")
        XCTAssertEqual(Int64(10_345_678_912).byteCountRepresentation, "10.3 GB")
        XCTAssertEqual(Int64(12_045_678_912).byteCountRepresentation, "12.0 GB")
        
        XCTAssertEqual(Int64(123_456_789_012).byteCountRepresentation, "123 GB")
    }
}

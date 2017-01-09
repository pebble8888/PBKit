//
//  NSString+PBBase64_Tests.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/09.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest

class NSString_PBBase64_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample1() {
        let str = "あいう"
        if let data:Data = str.data(using:.utf8) {
            data.withUnsafeBytes {(bytes:UnsafePointer<UInt8>) -> Void in
                let s:String = NSString.base64String(withChar: bytes, length: UInt(data.count)) as String
                XCTAssertEqual(s, "44GC44GE44GG")
            }
        }
    }
    
    func testExample2() {
        let str = "ab?cd~"
        if let data:Data = str.data(using:.utf8) {
            data.withUnsafeBytes {(bytes:UnsafePointer<UInt8>) -> Void in
                let s:String = NSString.base64String(withChar: bytes, length: UInt(data.count)) as String
                XCTAssertEqual(s, "YWI_Y2R-")
            }
        }
    }
    
    
}

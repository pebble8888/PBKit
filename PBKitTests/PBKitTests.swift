//
//  PBKitTests.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/08.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest
#if os(iOS)
#else
import PBKit_macOS
#endif

class PBKitTestsSwift: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let str:String = DateFormatter.standard.string(from: Date())
        NSLog("\(str)")
        
        let dt = Date(standardDateString:"2016-02-01T01:00:00.000+0900")
        NSLog("\(dt)");
    }
    
}

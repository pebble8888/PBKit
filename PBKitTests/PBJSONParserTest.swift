//
//  PBJSONParserTest.swift
//  PBKit
//
//  Created by pebble8888 on 2017/02/06.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest

class PBJSONParserTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
        do {
            let a = try JSONSerialization.data(withJSONObject: ["alpha":["beta":"あいう", "gamma":"えおか"]], options: [])
            let b = try JSONSerialization.jsonObject(with: a, options: [])
            print("\(b)")
            print("\(PBJSONParser.debugDescriptionJP(b))")
            
            let c = try JSONSerialization.data(withJSONObject: ["alpha":["さしす", "せそた"]], options: [])
            print("\(c)")
            let d = try JSONSerialization.jsonObject(with: c, options: [])
            print("\(d)")
            print("\(PBJSONParser.debugDescriptionJP(d))")
        } catch {
            XCTFail()
        }
    }
    
    
}

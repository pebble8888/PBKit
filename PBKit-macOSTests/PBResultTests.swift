//
//  PBResultTests.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/15.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import XCTest
#if os(iOS)
@testable import PBKit
#else
@testable import PBKit_macOS
#endif

class PBResultTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    var pbsession: PBSession = PBSession(baseURL: "https://jsonplaceholder.typicode.com")

    func testSuccess() {
        let expectation = self.expectation(description: "")
        let req = pbsession.buildRequest("posts/1", method: "GET")
        pbsession.sendRequest(req, completion: { (result: PBResult) -> Void in
            XCTAssert(result.isSuccess)
            print("\(result)")
            expectation.fulfill()
        })
        waitForExpectations(timeout: 2.0, handler: nil)
    }
    func test404() {
        let expectation = self.expectation(description: "")
        let req = pbsession.buildRequest("hoge", method: "GET")
        pbsession.sendRequest(req, completion: { (result: PBResult) -> Void in
            if let pberror: PBError = result.error as? PBError {
                switch pberror {
                case .httpResponseError(let statusCode, _):
                    XCTAssert(statusCode == 404)
                    expectation.fulfill()
                    return
                default:
                    break
                }
            }

            XCTFail("")
            expectation.fulfill()
        })
        waitForExpectations(timeout: 2.0, handler: nil)
    }
}

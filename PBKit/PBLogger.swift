//
//  PBLogger.swift
//  onsenlife
//
//  Created by pebble8888 on 2016/03/28.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation

public func DEBUG_LOG(logMessage: String, functionName: String = #function, line: Int = #line) {
    NSLog("\(functionName) Line:[\(line)] \(logMessage)")
}
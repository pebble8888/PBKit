//
//  PBLogger.swift
//
//  Created by pebble8888 on 2016/03/28.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation

public func DEBUG_LOG(_ logMessage: String, functionName: String = #function, line: Int = #line) {
    NSLog("\(functionName) Line:[\(line)] \(logMessage)")
}

public func debug_log(_ logMessage: String, functionName: String = #function, line: Int = #line) {
    let fm = FileManager.default
    let path = "/tmp/pb.log"
    if !fm.fileExists(atPath:path) {
        fm.createFile(atPath:path, contents: nil, attributes: nil)
    }
    if let fh = FileHandle(forWritingAtPath: path) {
        let date = Date()
        let s = "\(date.standardRepresentation) \(functionName) Line:\(line) \(logMessage)\n"
        if let data = s.data(using: .utf8) {
            fh.seekToEndOfFile()
            fh.write(data)
            fh.synchronizeFile()
        }
        fh.closeFile()
    }
}

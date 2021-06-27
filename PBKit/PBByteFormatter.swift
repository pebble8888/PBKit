//
//  PBByteCountFormatter.swift
//  PBKit
//
//  Created by pebble8888 on 2017/04/08.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

open class PBByteCountFormatter {
    open func string(fromByteCount byteCount: Int64) -> String
    {
        return type(of:self).string(fromByteCount:byteCount)
    }

    open class func string(fromByteCount byteCount: Int64) -> String {
        let v = byteCount
        if v == 0 {
            return "0 B"
        } else if v < 1_000 {
            return "1 KB"
        } else {
            let d = ten_digit(v)
            switch d {
            case 0...6:
                return "\(v/1_000) KB"
            case 7...9:
                return "\(v/1_000_000) MB"
            case 10...11:
                let vv = Double(v)/Double(1_000_000_000)
                let f = numberFormatter(digits: Int(12-d))
                if let s = f.string(from: NSNumber(value:vv)) {
                    return "\(s) GB"
                } else {
                    assert(false)
                    return "? GB"
                }
            default:
                return "\(v/1_000_000_000) GB"
            }
        }
    }
    
    // 5678 -> 4
    class func ten_digit(_ value: Int64) -> Int64 {
        var c: Int64 = 0
        if value == 0 {
            return 1
        }
        
        var v = value
        while v != 0 {
            c += 1
            v /= 10
        }
        
        return c
    }

    fileprivate static func numberFormatter(digits: Int) -> NumberFormatter {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        f.maximumFractionDigits = digits
        f.positiveFormat = "0." + String(repeating: "0", count: digits)
        f.roundingMode = .floor
        return f
    }
}

extension Int64 {
    var byteCountRepresentation: String {
        let f = PBByteCountFormatter()
        return f.string(fromByteCount: self)
    }
}

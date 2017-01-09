//
//  String+PBURLSafeBase64.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/09.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

extension String {
    fileprivate static let table:[UInt8] = {
        let str:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_="
        return str.utf8.map { UInt8($0) } 
    }()
    
    public func base64UrlSafe() -> String {
        let input = self.utf8
        let length = input.count
        var data:Data = Data()
        // process by 3 bytes(24bit=6bit*3)
        for i in stride(from:0, to: length, by: 3) {
            var value:Int = 0
            for j in stride(from:i, to: i+3, by: 1) {
                value <<= 8
                if j < length {
                    value |= (0xFF & Int(input[input.index(input.startIndex, offsetBy: j)]))
                }
            }
            // 0x3F = 63
            data.append(                   String.table[(value >> 18) & 0x3F])
            data.append(                   String.table[(value >> 12) & 0x3F])
            data.append((i + 1) < length ? String.table[(value >> 6)  & 0x3F] : "=".utf8.first!)
            data.append((i + 2) < length ? String.table[(value >> 0)  & 0x3F] : "=".utf8.first!)
        }
        guard let ret_str = String(data: data, encoding:.utf8) else { 
            return ""
        }
        return ret_str
    }
}

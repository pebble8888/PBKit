//
//  PBHex.swift
//  PBKit
//
//  Created by pebble8888 on 2017/06/10.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

public protocol HexRepresentable {
    func hexDescription() -> String
}

extension UInt8 : HexRepresentable
{
    public func hexDescription() -> String {
        return String(format:"%02x", self)
    }
}

extension Int32 : HexRepresentable
{
    public func hexDescription() -> String
    {
        return String(format:"%08x", self)
    }
}

extension String {
    public func unhexlify() -> [UInt8] {
        var pos = startIndex
        return (0..<characters.count/2).flatMap { _ in
            defer { pos = index(pos, offsetBy: 2) }
            return UInt8(self[pos...index(after: pos)], radix: 16)
        }
    }
}

extension Collection where Iterator.Element : HexRepresentable {
    public func hexDescription() -> String {
        return self.map({ $0.hexDescription() }).joined()
    }
}

extension Collection where Iterator.Element == UInt8 {
    public func utf8Description() -> String {
        guard let s = String(bytes: self, encoding: .utf8) else {
            return ""
        }
        return s
    }
}

extension Array where Element == UInt8 {
    public var description: String {
        return hexDescription()
    }
}

extension Data {
    public func hexDescription() -> String {
        return self.map({ String(format:"%02x", $0) }).joined() 
    }
}

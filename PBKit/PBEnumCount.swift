//
//  PBEnumCount.swift
//
//  Created by pebble8888 on 2016/07/21.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation

public protocol PBEnumCountable
{
    static func countEnum() -> Int
}

public extension PBEnumCountable where Self : RawRepresentable, Self.RawValue == Int {
    static func countEnum() -> Int {
        var count = 0
        while let _ = Self(rawValue: count) {
            count += 1
        }
        return count
    }
}

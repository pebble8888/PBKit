//
//  Float+PBMath.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/21.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

public func isNealyInteger<T : BinaryFloatingPoint>(val: T) -> Bool {
    return val.truncatingRemainder(dividingBy: 1.0) == 0.0
}

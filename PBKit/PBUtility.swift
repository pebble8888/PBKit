//
//  PBUtility.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/10.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation
import Accelerate

extension Int32
{
    func hexDescription() -> String
    {
        return String(format:"0x%x", self)
    }
}

extension UnsafeMutablePointer where Pointee == Float
{
    func maxMagnitude(count:UInt) -> Float
    {
        var max:Float = 0
        vDSP_maxmgv(self, 1, &max, count)
        return max
    }
}

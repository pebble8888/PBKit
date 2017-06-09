//
//  PBDSP.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/10.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation
import Accelerate

extension UnsafeMutablePointer where Pointee == Float
{
    func maxMagnitude(count:UInt) -> Float
    {
        var max:Float = 0
        vDSP_maxmgv(self, 1, &max, count)
        return max
    }
}

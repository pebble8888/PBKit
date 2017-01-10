//
//  PBUtility.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/10.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation
import Accelerate

func assertMainThread() {
    assert(Thread.isMainThread)
}

func assertNotMainThread() {
    assert(!Thread.isMainThread)
}

extension Int32
{
    func hexDescription() -> String
    {
        return String(format:"0x%x", self)
    }
}

extension UnsafeMutablePointer
{
    func maxMagnitude(count:UInt) -> Float
    {
        var max:Float = 0
        let p:UnsafeRawPointer = UnsafeRawPointer(self)
        let q:UnsafePointer<Float> = p.assumingMemoryBound(to: Float.self)
        vDSP_maxmgv(q, 1, &max, count)
        return max
    }
}

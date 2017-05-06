//
//  PBAssert.swift
//  PBKit
//
//  Created by pebble8888 on 2017/05/06.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

func assertMainThread() {
    assert(Thread.isMainThread)
}

func assertNotMainThread() {
    assert(!Thread.isMainThread)
}

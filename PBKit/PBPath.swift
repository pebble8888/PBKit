//
//  PBPath.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/21.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

struct PBPath {
    static func resourcePath() -> String? {
        return Bundle.main.resourcePath
    }

    static func documentsPath() -> String? {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    }
}

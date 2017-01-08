//
//  PBMutableData.swift
//
//  Created by pebble8888 on 2016/11/12.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation

enum PBMutableDataError: Error {
    case cannotConversion
}

extension NSMutableData {
    func appendString(_ string: String) throws {
        if let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true) {
            append(data)
        } else {
            throw PBMutableDataError.cannotConversion
        }
    }
}

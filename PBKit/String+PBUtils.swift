//
//  String+PBUtils.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/09.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

// "foo@gmail.com" -> "foo"
extension String {
    public func deletedTrailingAtMark() -> String {
        guard let r_atmark:Range = self.range(of: "@") else {
            return ""
        }
        return String(self[..<r_atmark.lowerBound])
    }
}

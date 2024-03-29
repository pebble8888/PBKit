//
//  DateFormatter+PBExtension.swift
//
//  Created by pebble8888 on 2017/01/08.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

extension DateFormatter {
    /**
     * "2016-02-01T01:00:00.000+0000"
     */
    public static let standard: DateFormatter = {
        let obj = DateFormatter()
        obj.locale = Locale(identifier: "en_US_POSIX")
        obj.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.000'Z"
        obj.timeZone = TimeZone(secondsFromGMT: 0)
        return obj
    }()

    public static let simple: DateFormatter = {
        let obj = DateFormatter()
        obj.locale = Locale(identifier: "ja_JP")
        obj.dateFormat = "yyyy-MM-dd"
        obj.timeZone = TimeZone(secondsFromGMT: 0)
        return obj
    }()
}

extension Date {
    public init?(standardDateString: String) {
        guard let obj = DateFormatter.standard.date(from: standardDateString) else { return nil }
        self = obj
    }

    public init?(simpleDateString: String) {
        guard let obj = DateFormatter.simple.date(from: simpleDateString) else { return nil }
        self = obj
    }

    public var standardRepresentation: String {
        return DateFormatter.standard.string(from: self)
    }
}

//
//  PBDate.swift
//  onsenlife
//
//  Created by pebble8888 on 2016/04/17.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation

extension NSDate {
    var year:Int {
        get {
            let calendar = NSCalendar.currentCalendar()
            let comp : NSDateComponents = calendar.components(
                NSCalendarUnit.Year, fromDate: self)
            return comp.year
        }
    }

    var month:Int {
        get {
            let calendar = NSCalendar.currentCalendar()
            let comp : NSDateComponents = calendar.components(
                NSCalendarUnit.Month, fromDate: self)
            return comp.month
        }
    }
}

func > (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceReferenceDate > rhs.timeIntervalSinceReferenceDate
}

func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceReferenceDate < rhs.timeIntervalSinceReferenceDate
}

func >= (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceReferenceDate >= rhs.timeIntervalSinceReferenceDate
}

func <= (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceReferenceDate <= rhs.timeIntervalSinceReferenceDate
}
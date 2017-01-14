//
//  PBDate.swift
//
//  Created by pebble8888 on 2016/04/17.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation

public extension Date {
    init(year:Int, month:Int, day:Int) {
        let calendar:Calendar = Calendar.current
        var components:DateComponents = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        let d = calendar.date(from: components)!
        self.init(timeInterval:0, since:d)
    }
    var year:Int {
        get {
            let calendar = Calendar.current
            let comp : DateComponents = (calendar as NSCalendar).components(
                NSCalendar.Unit.year, from: self)
            return comp.year!
        }
    }

    var month:Int {
        get {
            let calendar = Calendar.current
            let comp : DateComponents = (calendar as NSCalendar).components(
                NSCalendar.Unit.month, from: self)
            return comp.month!
        }
    }
}

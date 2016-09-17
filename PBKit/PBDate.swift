//
//  PBDate.swift
//  onsenlife
//
//  Created by pebble8888 on 2016/04/17.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation

extension Date {
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

//
//  UIColor+PBHex.swift
//
//  Created by pebble8888 on 2017/01/08.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString:String, alpha:CGFloat) {
        let scanner = Scanner(string:hexString)
        var color:UInt32 = 0
        if !scanner.scanHexInt32(&color) {
            self.init(white:0, alpha:1)
            return
        }
        let r:CGFloat = CGFloat((color & 0xFF0000) >> 16) / 255.0
        let g:CGFloat = CGFloat((color & 0x00FF00) >> 8) / 255.0
        let b:CGFloat = CGFloat(color & 0x0000FF) / 255.0
        self.init(red:r, green:g, blue:b, alpha:alpha)
    }
}

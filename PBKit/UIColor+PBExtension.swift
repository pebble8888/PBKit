//
//  UIColor+PBExtension.swift
//
//  Created by pebble8888 on 2017/01/08.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit

public extension UIColor {
    @objc convenience init(hexString: String, alpha: CGFloat) {
        let scanner = Scanner(string: hexString)
        var color:UInt32 = 0
        if !scanner.scanHexInt32(&color) {
            self.init(white: 0, alpha: 1)
            return
        }
        let r: CGFloat = CGFloat((color & 0xFF0000) >> 16) / 255.0
        let g: CGFloat = CGFloat((color & 0x00FF00) >> 8) / 255.0
        let b: CGFloat = CGFloat(color & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    @objc convenience init(intRed: Int, intGreen: Int, intBlue: Int, intAlpha: Int = 255) {
        let r: CGFloat = CGFloat(intRed)/255.0
        let g: CGFloat = CGFloat(intGreen)/255.0
        let b: CGFloat = CGFloat(intBlue)/255.0
        let a: CGFloat = CGFloat(intAlpha)/255.0
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
#endif

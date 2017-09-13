//
//  ArrayExtension.swift
//
//  Created by pebble8888 on 2016/11/30.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation

public extension Array {
    mutating func swapElement(_ index1:Int, _ index2:Int){
        if index1 < self.count && index2 < self.count {
            self.swapAt(index1, index2)
        }
    }
}

public protocol ComparableIndex {
    static func LessIndex(_ lhs: Self, _ rhs: Self) -> Bool
}

public extension Array where Element : ComparableIndex {
    mutating func sortWithIndex() {
        self.sort(by: { (a, b) in Element.LessIndex(a, b) })
    }
}

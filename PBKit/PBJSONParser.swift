//
//  PBJSONParser.swift
//
//  Created by pebble8888 on 2017/01/14.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

public class PBJSONParser {
    /**
     @return JSON Foundation Object
        - Top level object is an Array or Dictionary
        - All objects are String, Number(Integer, FlotingPoint), Array, Dictionary, or Null
        - All dictionary keys are Strings
        - Numbers are not NaN or infinity
     */
    static public func parser(data: Data?) -> Any? {
        guard let data = data, data.count > 0 else {
            return [:]
        }
        do {
            return try JSONSerialization.jsonObject(with: data,
                options: JSONSerialization.ReadingOptions.allowFragments)
        } catch {
            if let str:String = String(data:data, encoding:String.Encoding.utf8) {
                return str
            } else {
                // not utf8 string -> nil
                return nil
            }
        }
    }
    
}

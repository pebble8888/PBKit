//
//  PBJSONParser.swift
//
//  Created by pebble8888 on 2017/01/14.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

public class PBJSONParser {
    /**
     @brief  data to JSON Foundation Object
        - Top level object is an Array or Dictionary
        - All objects are String, Number(Integer, FlotingPoint), Array, Dictionary, or Null
        - All dictionary keys are Strings
        - Numbers are not NaN or infinity
     */
    static public func parse(data: Data?) throws -> Any {
        guard let data = data, data.count > 0 else {
            return [:]
        }
        do {
            return try JSONSerialization.jsonObject(with: data,
                options: JSONSerialization.ReadingOptions.allowFragments)
        } catch {
            if let str:String = String(data:data, encoding:String.Encoding.utf8) {
                throw PBError.jsonParseError(reason: "can't parse but string", info: str)
            } else {
                // not utf8 string -> nil
                throw PBError.jsonParseError(reason: "can't parse also data", info: data)
            }
        }
    }
    
    /**
     @brief  JSON Foundation Object to data
     */
    static public func build(jsonObject:Any) throws -> Data { 
        guard JSONSerialization.isValidJSONObject(jsonObject) else {
            throw NSError(domain: NSCocoaErrorDomain, code: 3840, userInfo: nil)
        }
        return try JSONSerialization.data(withJSONObject: jsonObject)
    }
    
}

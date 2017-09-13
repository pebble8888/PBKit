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
    public static func parse(data: Data?) throws -> Any {
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
    public static func buildData(jsonObject:Any) throws -> Data { 
        guard JSONSerialization.isValidJSONObject(jsonObject) else {
            throw NSError(domain: NSCocoaErrorDomain, code: 3840, userInfo: nil)
        }
        return try JSONSerialization.data(withJSONObject: jsonObject)
    }
    
    /**
     @brief
     */
    public static func debugDescriptionJP(_ jsonObject:Any) -> String
    {
        guard let dic = jsonObject as? [String:Any] else {
            return "is not jsonObject"
        }
        let ss:[String] = PBJSONParser.debugDescriptionJP(dic: dic, s:[])
        var level:Int = 0
        var sum = ""
        for s in ss {
            var done:Bool = false
            var head:String?
            var tail:String?
            if s.utf8.count > 0 {
                head = String(s[s.startIndex])
                tail = String(s[s.index(s.endIndex, offsetBy:-1)])
                if head == "{" || head == "(" || tail == "{" || tail == "(" {
                    sum += (PBJSONParser.tab(level:level) + s) + "\n"
                    level += 1
                    done = true
                } else if head == "}" || head == ")" || tail == "}" || tail == ")" {
                    level -= 1
                    sum += (PBJSONParser.tab(level:level) + s) + "\n"
                    done = true
                }
            }
            if !done {
                sum += (PBJSONParser.tab(level:level) + s) + "\n"
            }
        }
        return sum
    }
    
    private static func debugDescriptionJP(dic:[String:Any], s:[String]) -> [String]
    {
        var t = s
        for (k, v) in dic {
            if let a = v as? [String:Any] {
                let b:[String] = debugDescriptionJP(dic: a, s: t)
                t.append("{")
                t.append("\(k) = {")
                t.append(contentsOf: b)
                t.append("};")
                t.append("}")
            }
            else if let ary = v as? Array<[String:Any]> {
                t.append("(")
                for vd in ary {
                    let b:[String] = debugDescriptionJP(dic: vd, s: t)
                    t.append(contentsOf: b)
                    t.append(";")
                }
                t.append(")")
            }
            else if let ary = v as? Array<String> {
                t.append("{")
                t.append("\(k) = (")
                for vd in ary {
                    t.append("\"\(vd)\",")
                }
                t.append(");")
                t.append("}")
            }
            else if let v = v as? String {
                t.append("\(k) = \"\(v)\";")
            }
            else {
                t.append("\(k) = \(v);")
            }
        }
        return t
    }
    
    private static func tab(level:Int) -> String
    {
        assert(level >= 0)
        var sum = ""
        for _ in 0..<level {
            sum += "    "
        }
        return sum
    }
    
}

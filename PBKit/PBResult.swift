//
//  PBResult.swift
//
//  Created by pebble8888 on 2017/01/13.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

public enum PBError: Error, CustomStringConvertible
{
    case general(error:Error, info:Any)
    case httpResponseError(statusCode:Int, info:Any)
    case nonHTTPURLResponse
    case jsonParseError(reason:String, info:Any)
    
    public var description:String {
        switch self {
        case .general(let error, let info):
            return "general \(error) \(info)"
        case .httpResponseError(let statusCode, let info):
            return "httpResponseError \(statusCode) \(info)"
        case .nonHTTPURLResponse:
            return "nonHTTPURLResponse"
        case .jsonParseError(let reason, let info):
            return "jsonParseError \(reason)\(info)" 
        }
    }
}

public enum PBResult {
    case success(Any)
    case failure(Error)
    
    // value | error |
    // -     | -     | error 
    // -     | nil   | success
    // nil   | -     | error 
    // nil   | nil   | success [:]
    public init(_ value:Any?, _ error:Error?)
    {
        if let value = value {
            if let error = error {
                // general error
                self = .failure(PBError.general(error:error, info:value))
            } else {
                // success
                self = .success(value) 
            }
        } else {  
            if let error = error {
                // error
                self = .failure(error)
            } else {
                // empty dictionary
                self = .success([:])
            }
        }
    }
    
    public init(data:Data?, response:URLResponse?, error:Error?)
    {
        switch (data, response, error) {
        case (_, _, let error?): // error unwrap
            // error is non nil
            self = .failure(error)
        case (let data?, let httpResponse as HTTPURLResponse, _):
            switch httpResponse.statusCode {
            case 200 ..< 300:
                let json:Any? = PBJSONParser.parser(data:data)
                self = PBResult(json, error)
            default:
                self = .failure(PBError.httpResponseError(statusCode: httpResponse.statusCode, info:data))
            }
        default:
            self = .failure(PBError.nonHTTPURLResponse)
        }
    }
    
    public init(value: Any) {
        self = .success(value)
    }
    
    public init(error: Error) {
        self = .failure(error)
    }
    
    public var isSuccess: Bool {
        switch self {
        case .success: return true
        case .failure: return false
        }
    }
    
    public var isFailure: Bool {
        return !isSuccess
    }
    
    public var value: Any? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }
    
    public var error: Error? {
        switch self {
        case .success: return nil
        case .failure(let error): return error
        }
    }
    
    public func dematerialize() throws -> Any {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
    
    public func evaluateForArray() throws -> Array<[String:Any]> {
        // dematerialize() throw error if failure  
        let value:Any = try self.dematerialize()
        guard let ary = value as? Array<[String:Any]> else {
            if let v = value as? String {
                throw PBError.jsonParseError(reason: "is not array", info:v)
            } else {
                throw PBError.jsonParseError(reason: "is not array", info:value)
            }
        }
        return ary
    }
    
    public func evaluateForDictionary() throws -> [String:Any] {
        // dematerialize() throw error if failure  
        let value = try self.dematerialize()
        guard let dic = value as? [String:Any] else {
            if let v = value as? String {
                throw PBError.jsonParseError(reason: "is not dictionary", info:v)
            } else {
                throw PBError.jsonParseError(reason: "is not dictionary", info:value)
            }
        }
        return dic
    }
}

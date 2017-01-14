//
//  PBResult.swift
//
//  Created by pebble8888 on 2017/01/13.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

enum PBError: Error
    ,CustomStringConvertible
    ,CustomDebugStringConvertible
{
    case general(Any, Error)
    
    var description:String {
        switch self {
        case .general(_, let error):
            return "\(error)"
        }
    }
    
    var debugDescription: String {
        switch self {
        case .general(let value, let error):
            return "\(error) \(value)"
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
                self = .failure(PBError.general(value, error))
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
}

//
//  PBSession.swift
//  PBKit
//
//  Created by pebble8888 on 2017/01/15.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

public struct PBSession {
    private let baseURL:String
    
    public init(baseURL:String){
        self.baseURL = baseURL
    }
    
    public func buildRequest(_ path:String, method: String) -> NSMutableURLRequest {
        let mPath:String = path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let requestURL = URL(string: "\(baseURL)/\(mPath)")
        let request = NSMutableURLRequest(url: requestURL!)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    public func sendRequest(_ request: URLRequest, completion:@escaping (PBResult) -> Void) -> () {
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler:
            { (data: Data?, response: URLResponse?, error: Error?) in
            let result:PBResult = PBResult(data:data, response:response, error:error)
            DispatchQueue.main.async(execute: { completion(result) } )
        }) 
        task.resume()
    }
}

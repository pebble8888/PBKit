//
//  PBCookieStorage.swift
//
//  Created by pebble8888 on 2017/01/08.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation

protocol PBCookieStorageProtocol
{
    func cookiesForURL(url:URL) -> [HTTPCookie]
    func setCookies(cookies:[HTTPCookie])
}

class PBCookieStorage : NSObject, PBCookieStorageProtocol
{
    public func setCookie(cookie:HTTPCookie)
    {
        HTTPCookieStorage.shared.setCookie(cookie)
    }

    public func setCookies(cookies:[HTTPCookie])
    {
        for cookie in cookies {
            HTTPCookieStorage.shared.setCookie(cookie)
        }
    }

    public func cookiesForURL(url:URL) -> [HTTPCookie]
    {
        guard let cookies = HTTPCookieStorage.shared.cookies(for: url) else {
            return []
        }
        return cookies
    }
}

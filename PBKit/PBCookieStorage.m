//
//  PBCookieStorage.m
//
//  Created by pebble8888 on 2015/05/02.
//  Copyright (c) 2015 pebble. All rights reserved.
//

#import "PBCookieStorage.h"

@implementation PBCookieStorage

- (void)setCookie:(NSHTTPCookie *)aCookie
{
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:aCookie];
}

- (void)setCookies:(NSArray *)aCookies
{
    for( NSHTTPCookie* cookie in aCookies ){
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    }
}

- (NSArray *)cookiesForURL:(NSURL *)aURL
{
    return [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:aURL];
}

@end

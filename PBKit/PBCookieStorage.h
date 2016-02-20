//
//  PBCookieStorage.h
//
//  Created by pebble8888 on 2015/05/02.
//  Copyright (c) 2015 pebble. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBCookieStorageProtocol <NSObject>
- (NSArray *)cookiesForURL:(NSURL *)aURL;
- (void)setCookies:(NSArray *)aCookies;
@end

@interface PBCookieStorage : NSObject
<PBCookieStorageProtocol>
- (void)setCookie:(NSHTTPCookie*)aCookie;
- (void)setCookies:(NSArray *)aCookies;
- (NSArray *)cookiesForURL:(NSURL *)aURL;
@end

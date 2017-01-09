//
//  NSStringBase64.h
//
//  Created by pebble8888 on 2014/09/14.
//  Copyright (c) 2014 pebble. All rights reserved.
//
/**
 * @note    URL safe base64
 *          RFC4648
 *          no LF 62th:+ 63th:/
 *          =padding(4 multiple)
 *
 * @note    Base64 class in Ruby
 *          strict_decode64,  strict_encode64  : RFC 4648 no LF 62th:+ 63th:/
 *          urlsafe_decode64, urlsafe_encode64 : RFC 4648 no LF 62th:- 64th:_
 */
 
#ifndef NSStringBase64_h
#define NSStringBase64_h

#import <Foundation/NSString.h>

@interface NSString (NSStringBase64)

+ (NSString *)base64StringWithChar:(const unsigned char*)input length:(NSUInteger)length;
+ (NSString *)base64StringNoEqualWithChar:(const unsigned char *)input length:(NSUInteger)length;
@end

#endif

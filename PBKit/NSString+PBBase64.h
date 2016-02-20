//
//  NSStringBase64.h
//
//  Created by pebble8888 on 2014/09/14.
//  Copyright (c) 2014 pebble. All rights reserved.
//
/**
 * @note    ここで実装しているbase64の仕様は、RFC4648です。
 *          62番目の文字:+
 *          63番目の文字:/
 *          =パティングあり(4の倍数)
 *          改行なし
 *          RFC4648
 *
 *
 *  @note   RubyではBase64に以下のメソッドがあります。
 *          strict_decode64,  strict_encode64  : RFC 4648 改行なし
 *          urlsafe_decode64, urlsafe_encode64 : RFC 4648 改行なし +の代わりに-、 /の代わりに_
 */
 
#ifndef NSStringBase64_h
#define NSStringBase64_h


#import <Foundation/NSString.h>

@interface NSString (NSStringBase64)

+ (NSString *)base64StringWithChar:(const unsigned char*)input length:(NSUInteger)length;
+ (NSString *)base64StringNoEqualWithChar:(const unsigned char *)input length:(NSUInteger)length;
+ (NSString*)base64test;
@end

#endif

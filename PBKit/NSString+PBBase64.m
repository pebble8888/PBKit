//
//  NSString+PBBase64.m
//
//  Created by pebble8888 on 2014/09/14.
//  Copyright (c) 2014 pebble. All rights reserved.
//

#import "NSString+PBBase64.h"
#import <Foundation/NSData.h>

@implementation NSString (PBBase64)

/**
 * @brief 文字列をbase64化する
 */
+ (NSString *)base64StringWithChar:(const unsigned char*)input length:(NSUInteger)length
{
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_=";
    // サイズは決まっているので領域を先に取る
    NSMutableData *data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    // 領域の先頭ポインタを取得する
    uint8_t *output = (uint8_t *)data.mutableBytes;
    // 3バイト(24bit=6bit*3)ずつ処理する
    for (NSInteger i = 0; i < length; i += 3) {
        NSInteger value = 0;
        for (NSInteger j = i; j < (i + 3); ++j) {
            value <<= 8;
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        NSInteger index = (i / 3) * 4;
        // 0x3F = 63
        output[index + 0] =                    table[(value >> 18) & 0x3F];
        output[index + 1] =                    table[(value >> 12) & 0x3F];
        output[index + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[index + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}

/**
 * @brief 末尾の=を削除する
 */
+ (NSString*)base64StringNoEqualWithChar:(const unsigned char *)input length:(NSUInteger)length
{
    NSString* str = [[self class] base64StringWithChar:input length:length];
    return [str stringByReplacingOccurrencesOfString:@"=" withString:@""];
}

@end

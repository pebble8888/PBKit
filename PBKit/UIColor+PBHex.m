//
//  UIColor+PBHex.m
//
//  Created by pebble8888 on 2014/09/14.
//  Copyright (c) 2014 pebble. All rights reserved.
//

#import "UIColor+PBHex.h"

@implementation UIColor (PBHex)
+ (id)colorWithHexString:(NSString *)hex alpha:(CGFloat)a {
    NSScanner *colorScanner = [NSScanner scannerWithString:hex];
    unsigned int color;
    if (![colorScanner scanHexInt:&color]) return nil;
    CGFloat r = ((color & 0xFF0000) >> 16)/255.0f;
    CGFloat g = ((color & 0x00FF00) >> 8) /255.0f;
    CGFloat b =  (color & 0x0000FF) /255.0f;
    //NSLog(@"HEX to RGB >> r:%f g:%f b:%f a:%f\n",r,g,b,a);
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}
@end

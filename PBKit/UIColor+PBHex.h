//
//  UIColor+PBHex.h
//
//  Created by pebble8888 on 2014/09/14.
//  Copyright (c) 2014 pebble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

@interface UIColor (PBHex)
+ (id)colorWithHexString:(NSString *)hex alpha:(CGFloat)a;
@end

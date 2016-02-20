//
//  NSString+PBUtils.m
//
//  Created by pebble8888 on 2015/05/07.
//  Copyright (c) 2015 pebble8888. All rights reserved.
//

#import "NSString+PBUtils.h"

@implementation NSString (PBUtils)
+ (NSString*)stringByDeletingTrailingAtMark:(NSString *)aString
{
    NSRange r_atmark = [aString rangeOfString:@"@"];
    if( r_atmark.location == NSNotFound ) return nil;
    NSRange range = NSMakeRange(0, r_atmark.location);
    return [aString substringWithRange:range];
}

@end

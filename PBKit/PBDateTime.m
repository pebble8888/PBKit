//
//  PBDateTime.m
//
//  Copyright (c) 2014 pebble. All rights reserved.
//

#import "PBDateTime.h"

@interface PBDateTime ()
@property (nonatomic, strong) NSDate* date;
@end

@implementation PBDateTime
+ (NSDateFormatter *)simpleFormatter
{
    static NSDateFormatter* s_formatter = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        s_formatter = [[NSDateFormatter alloc] init];
        NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
        [s_formatter setLocale:locale];
        [s_formatter setDateFormat:@"yyyy-MM-dd"];
        [s_formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    });
    return s_formatter;
}

/**
 * "2016-02-01T01:00:00.000+09.00"
 */
+ (NSDateFormatter *)formatter
{
    static NSDateFormatter* s_formatter = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        s_formatter = [[NSDateFormatter alloc] init];
        NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [s_formatter setLocale:locale];
        [s_formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.000'Z"];
        [s_formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    });
    return s_formatter;
}

+ (instancetype)pbdatetimeWithDateString:(NSString *)aDateString
{
    return [[self alloc] initWithDateString:aDateString];
}

- (id)initWithDateString:(NSString *)aDateString
{
    self = [super init];
    if (self){
        NSDateFormatter* formatter = [[self class] formatter];
        self.date = [formatter dateFromString:aDateString];
    }
    return self;
}

- (id)initWithSimpleDateString:(NSString*)aSimpleDateString
{
    self = [super init];
    if (self){
        NSDateFormatter* formatter = [[self class] simpleFormatter];
        self.date = [formatter dateFromString:aSimpleDateString];
    }
    return self;
}

@end

//
//  PBDateTime.h
//
//  Copyright (c) 2014 pebble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBDateTime : NSObject
+ (instancetype)pbdatetimeWithDateString:(NSString *)aDateString;
- (id)initWithDateString:(NSString *)aDateString;
@property (readonly) NSDate* date;
@end

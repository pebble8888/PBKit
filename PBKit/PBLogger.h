//
//  PBLogger.h
//
//  Created by pebble8888 on 2015/05/02.
//  Copyright (c) 2015 pebble. All rights reserved.
//

#import <Foundation/Foundation.h>

#if defined(DEBUG) || defined(_DEBUG)
  #define DEBUG_LOG(fmt,...) NSLog( @"%s [Line:%d] " fmt, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
  #define DEBUG_LOG(fmt,...)
#endif

//
//  PBLogger.m
//  PBKit
//
//  Created by pebble on 2017/04/02.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

#import <Foundation/Foundation.h>

void Logf(NSString* fmt, ...)
{
    NSFileManager* fm = NSFileManager.defaultManager;
    NSString* path = @"/tmp/pbc.log";
    if (![fm fileExistsAtPath:path]) {
        [fm createFileAtPath:path contents: nil attributes: nil];
    }
    NSFileHandle* fh = [NSFileHandle fileHandleForWritingAtPath: path];
    if (fh != nil){
        va_list args;
        va_start(args, fmt);
        NSString* s = [[NSString alloc] initWithFormat:fmt arguments:args];
        va_end(args);
        
        NSData* data = [s dataUsingEncoding:NSUTF8StringEncoding];
        if (data != nil){
            [fh seekToEndOfFile];
            [fh writeData:data];
            [fh synchronizeFile];
        }
        [fh closeFile];
    }
}

//
//  Platform.swift
//
//  Created by pebble8888 on 2016/05/09.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation

struct PBPlatform {
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}

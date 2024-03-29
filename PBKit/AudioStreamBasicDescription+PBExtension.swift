//
//  PBAudioTool.swift
//
//  Created by pebble8888 on 2017/01/08.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import Foundation
import AVFoundation

extension AudioStreamBasicDescription {
    // 16bit mono wav
    init?(monoWAV sampleRate: UInt32){
        #if os(iOS)
            guard let fmt = AVAudioFormat(commonFormat: AVAudioCommonFormat.pcmFormatInt16,
                                    sampleRate: Double(sampleRate),
                                    channels: 1,
                                    interleaved: true) else { return nil }
            self = fmt.streamDescription.pointee
        #else
            let fmt = AVAudioFormat(commonFormat: AVAudioCommonFormat.pcmFormatInt16,
                                    sampleRate: Double(sampleRate),
                                    channels: 1,
                                    interleaved: true)
            self = fmt.streamDescription.pointee
        #endif
    }
    // 16bit stereo wav
    init?(stereoWAV sampleRate: UInt32) {
        #if os(iOS)
            guard let fmt = AVAudioFormat(commonFormat: AVAudioCommonFormat.pcmFormatInt16,
                                    sampleRate: Double(sampleRate),
                                    channels: 2,
                                    interleaved: true) else { return nil }
            self = fmt.streamDescription.pointee
        #else
            let fmt = AVAudioFormat(commonFormat: AVAudioCommonFormat.pcmFormatInt16,
                                    sampleRate: Double(sampleRate),
                                    channels: 2,
                                    interleaved: true)
            self = fmt.streamDescription.pointee
        #endif
    }
}

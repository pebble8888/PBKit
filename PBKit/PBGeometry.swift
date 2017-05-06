//
//  PBGeometry.swift
//  PBKit
//
//  Created by pebble8888 on 2017/05/06.
//  Copyright © 2017年 pebble8888. All rights reserved.
//

import CoreGraphics

public func + (p1:CGPoint, p2:CGPoint) -> CGPoint {
    return CGPoint(x:p1.x + p2.x, y:p1.y + p2.y)
}

public func - (p1:CGPoint, p2:CGPoint) -> CGPoint {
    return CGPoint(x:p1.x - p2.x, y:p1.y - p2.y)
}

public func * (p:CGPoint, f:CGFloat) -> CGPoint {
    return CGPoint(x:p.x * f, y:p.y * f)
}

public func / (p:CGPoint, f:CGFloat) -> CGPoint {
    if f == 0.0 {
        return p
    }
    return p * (1.0/f)
}

public func + (p:CGPoint, v:CGVector) -> CGPoint {
    return CGPoint(x:p.x + v.dx, y:p.y + v.dy)
}

public func - (p:CGPoint, v:CGVector) -> CGPoint {
    return CGPoint(x:p.x - v.dx, y:p.y - v.dy)
}

public func * (v:CGVector, f:CGFloat) -> CGVector {
    return CGVector(dx:v.dx * f, dy:v.dy * f)
}

public func / (v:CGVector, f:CGFloat) -> CGVector {
    if f == 0.0 {
        return v
    }
    return v * (1.0/f)
}

public extension CGRect {
    public func center() -> CGPoint {
        return CGPoint(x:self.midX, y:self.midY)
    }
}

public func * (rc:CGRect, f:CGFloat) -> CGRect {
    return CGRect(x: rc.origin.x * f, y: rc.origin.y * f, width: rc.size.width * f, height: rc.size.height * f)
}

public func / (rc:CGRect, f:CGFloat) -> CGRect {
    if f == 0.0 {
        return rc
    }
    return rc * (1.0/f)
}

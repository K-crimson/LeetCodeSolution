//
//  LC69 x平方根.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/5/29.
//

import Foundation



func solution69(_ x: Int) -> Int {
    if x == 1 {
        return 1
    }
    
    var l = 0
    var r = x
    while true {
        var mid = (l + r) / 2
        if mid * mid < x {
            if (mid + 1) * (mid + 1) > x {
                return mid
            }
            l = mid
        } else if mid * mid > x {
            if (mid - 1) * (mid - 1) <= x {
                return mid - 1
            }
            r = mid
        } else {
            return mid
        }
    }
}



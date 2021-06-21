//
//  LC67 二进制求和.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/6/21.
//

import Foundation
func solution67(_ a: String, _ b: String) -> String {
    var longer = Array(a.count > b.count ? a.reversed() : b.reversed())
    var shorter = Array(a.count > b.count ? b.reversed() : a.reversed())
    var res = ""
    while longer.count != shorter.count {
        shorter += "0"
    }
    var sum = 0
    for i in 0 ..< longer.count {
        sum += Int(String(longer[i]))!
        sum += i < shorter.count ? Int(String(shorter[i]))! : 0
        res.append(String(sum % 2))
        sum /= 2
    }
    if sum == 1 {
        res.append("1")
    }
    
    return String(res.reversed())
}

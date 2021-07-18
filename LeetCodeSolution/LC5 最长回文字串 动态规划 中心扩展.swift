//
//  LC5 最长回文字串 动态规划 中心扩展.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/18.
//

import Foundation

func solution5(_ s: String) -> String {
        if s == "" {
            return ""
        }
        let arr = Array(s)
        var i = 0, j = 0

        for x in 0..<arr.count {
            let longer = max(helper5(left: x,right: x,charArr: arr), helper5(left: x, right: x + 1, charArr: arr))
            if longer > j - i {
                i = x - (longer - 1) / 2
                j = x + longer / 2
            }
        }

    return String(arr[i...j])
    }

func helper5(left: Int, right: Int, charArr: [Character]) -> Int {
    var l = left, r = right
    while l >= 0 && r < charArr.count && charArr[l] == charArr[r] {
        l -= 1
        r += 1
    }
    return r - l - 1
}

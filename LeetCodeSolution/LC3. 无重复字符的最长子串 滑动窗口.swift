//
//  LC3. 无重复字符的最长子串 滑动窗口.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/16.
//

import Foundation
func solution3(_ s: String) -> Int {
    if s == "" {
        return 1
    }
    var maxNum = 0
    let arr = Array(s)
    var dic = [Character : Int]()
    var i = 0, j = 1
    for char in arr {
        
        if dic.keys.contains(char) {
            i = max(i, dic[char]!)
        }
        dic[char] = j
        maxNum = max(j - i, maxNum)
        j += 1
    }
    return maxNum
}

//
//  LC58 最后单词长度 字符串.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/5/28.
//

import Foundation

func solution58(_ s: String) -> Int {
    var lengthOfCurrentWord : Int = 0
    var char = [Character].init(s)
    for i in (0..<char.count).reversed() {
        if char[i] != " " {
            lengthOfCurrentWord += 1
        } else if (char[i] == " " && lengthOfCurrentWord != 0) {
            break
        }
    }
    return lengthOfCurrentWord
}



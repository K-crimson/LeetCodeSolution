//
//  LC167 两数之和II 双指针.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/15.
//

import Foundation
func generate(_ numRows: Int) -> [[Int]] {
    var array = [[Int]]()
    for i in 1...numRows {
        var tempArr = [Int]()
        for j in 1...i  {
            if j == 1 || j == i {
                tempArr.append(1)
            } else {
                tempArr.append(array.last![j - 2] + array.last![j - 1])
            }
        }
        array.append(tempArr)
    }
    return array
}

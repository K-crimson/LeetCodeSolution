//
//  LC6 Z字形变换.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/18.
//

import Foundation
func solution6(_ s: String, _ numRows: Int) -> String {
    if numRows < 2 || s.count <= numRows {
        return s
    }
    var res = ""
    var string = Array(s)
    var charArr = [String](repeating: "", count: numRows)
    var i = 0, flag = -1
    for c in string {
        if i == 0 || i == numRows - 1 {
            flag = -flag
        }
        charArr[i].append(c)
        i += flag
    }
    charArr.forEach({ res.append($0)})
    return res
}

//
//  LC12 整数转罗马数字.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/19.
//

import Foundation
func solution12(_ num: Int) -> String {
    var num = num
    var dict = [Int : String]()
    dict[1] = "I"; dict[4] = "IV"; dict[5] = "V"; dict[9] = "IX"; dict[10] = "X"; dict[40] = "XL"; dict[50] = "L";
    dict[90] = "XC"; dict[100] = "C"; dict[400] = "CD"; dict[500] = "D"; dict[900] = "CM"; dict[1000] = "M"
    let keys = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    var res = ""
    for key in keys {
        while num >= key {
            num -= key
            res.append(dict[key]!)
        }
    }
    return res
}

//
//  LC8 字符串转整数.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/18.
//

import Foundation
class Solution08 {
    var isNegative = false
    
    func myAtoi(_ str: String) -> Int {
        let string = preProcessString(str)
        var result = 0
        for char in string {
            if result < Int.max / 10 {
                result *= 10
                result += Int(String(char))!
            }
        }
        if result > Int32.max {
            if isNegative {
                result = Int(Int32.max) + 1
            } else {
                result = Int(Int32.max)
            }
        }
        return isNegative ? -result : result
    }
    
    func preProcessString(_ string: String) -> [Character] {
        let prefix = Set<Character>(arrayLiteral: "-", "+")
        var result = [Character]()
        var hasNumber = false
        for char in string {
            // 如果还没出现过数字，并且是符号，就处理符号
            if !hasNumber && prefix.contains(char) {
                isNegative = char == "-" ? true : false
                hasNumber = true
            }
            // 如果是数字，添加到结果中
            else if char.isNumber {
                hasNumber = true
                result.append(char)
            }
            // 如果出现过数字，但是当前不是数字，结束
            else if hasNumber && !char.isNumber {
                break
            }
            // 如果当前是非符号和空格以外的字符，且没出现过数字，结束
            else if !hasNumber && !char.isNumber && !prefix.contains(char) && char != " "{
                break
            }
        }
        return result
    }
}

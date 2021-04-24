//
//  LC20 有效的括号 栈.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/4/23.
//

import Foundation
func isValid(_ s: String) -> Bool {

    var tempArr = [Character]()

    for c in s {
        switch  c {
        case "{","[","(":
            tempArr.append(c)
        case "}":
            if tempArr.popLast() != "{" {
                return false
            }
        case "]":
            if tempArr.popLast() != "[" {
                return false
            }
        case ")":
            if tempArr.popLast() != "(" {
                return false
            }
        default:
            break
        }
    }

    if tempArr.isEmpty {
        return true
    } else {
        return false
    }

}

//
//  LC66 加一 .swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/5/28.
//

import Foundation


func solution66(_ digits: [Int]) -> [Int] {
    var i = digits.count - 1
    var array = digits
    
    if i == 0 {
        if array[0] != 9 {
            array[0] += 1
        } else {
            array = [1,0]
        }
        return array
    }
    
    array[i] += 1
    while i >= 0 {
        if array[i] < 10 {
            return array
        } else {
            array[i] = 0
            if i > 0 {
                array[i - 1] += 1
            } else {
                array.insert(1, at: 0)
            }
        }
        i -= 1
    }
    return array
}



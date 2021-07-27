//
//  main.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/4/13.
//

import Foundation

let startTime = CFAbsoluteTimeGetCurrent()
var a = [5,2,3,4,1]

let sortFunc = SortAlgorithms.Onlogn.quickSort()
sortFunc.quickSort(&a)





let endTime = CFAbsoluteTimeGetCurrent()

debugPrint("代码执行时长：%f 毫秒", (endTime - startTime)*1000)


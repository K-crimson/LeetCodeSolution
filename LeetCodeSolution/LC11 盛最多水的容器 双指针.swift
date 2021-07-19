//
//  LC11 盛最多水的容器.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/19.
//

import Foundation
func solution11(_ height: [Int]) -> Int {
   var res = 0
   var l = 0, r = height.count - 1
   while l < r {
       res = max(caculateArea(l,height[l],r,height[r]), res)
       if height[l] > height[r] {
           r -= 1
       } else {
           l += 1
       }
   }
   return res
}

func caculateArea(_ leftX: Int, _ leftY: Int, _ rightX: Int, _ rightY: Int) -> Int {
   (rightX - leftX) * min(leftY,rightY)
}

//
//  LC108 有序数组转换为平衡二叉树.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/5/30.
//

import Foundation


func solution108(_ nums: [Int]) -> TreeNode? {
    return helper108(nums, 0, nums.count - 1)
}

func helper108(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
    if lo > hi { return nil }
    var mid = lo + (hi - lo) / 2
    var node = TreeNode.init(nums[mid])
    node.left = helper108(nums, lo, mid - 1)
    node.right = helper108(nums, mid + 1, hi)
    return node
}

//func solution108(_ nums: [Int]) -> TreeNode? {
//        return dfs(nums, 0, nums.count - 1)
//    }
//
//    func dfs(_ nums: [Int], _ low: Int, _ high: Int) -> TreeNode? {
//        if low > high { return nil }
//        var mid = low + (high - low) / 2
//        let root = TreeNode.init(nums[mid])
//        root.left = dfs(nums, low, mid - 1)
//        root.right = dfs(nums, mid + 1, high)
//        return root
//    }
//
//

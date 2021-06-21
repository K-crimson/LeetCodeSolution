//
//  LC112 路径总和 二叉树.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/6/16.
//

import Foundation



/// 递归：

func solution112Recursion(_ root: TreeNode?,_ targetSum: Int) -> Bool {
    if root == nil {
        return false
    }
    if root?.left == nil && root?.right == nil && root?.val == targetSum {
        return true
    }
    
    return solution112Recursion(root?.left, targetSum - root!.val) || solution112Recursion(root?.right, targetSum - root!.val)
}

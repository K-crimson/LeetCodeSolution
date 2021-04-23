//
//  LC100 相同的树 二叉树 递归.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/4/23.
//

import Foundation
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }

    return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
}

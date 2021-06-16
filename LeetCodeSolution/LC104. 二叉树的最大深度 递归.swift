//
//  LC104. 二叉树的最大深度.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/5/15.
//

import Foundation
func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    } else {
        let left = maxDepth(root!.left)
        let right = maxDepth(root!.right)
        return [left,right].max()! + 1
    }

}



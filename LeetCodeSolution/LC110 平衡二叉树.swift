//
//  LC110 平衡二叉树.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/6/5.
//

import Foundation

func solution110(treeNode: TreeNode) -> Bool {
    return helper110(treeNode: treeNode) >= 0
}

func helper110(treeNode: TreeNode?) -> Int {
    if treeNode == nil {
        return 0
    }
    let leftHeight: Int
    let rightHeight: Int
    
    leftHeight = helper110(treeNode: treeNode?.left)
    rightHeight = helper110(treeNode: treeNode?.right)
    if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
        return -1
    } else {
        return max(leftHeight, rightHeight) + 1
    }
}

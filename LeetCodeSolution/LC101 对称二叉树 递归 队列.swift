//
//  LC101 对称二叉树 递归 队列.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/4/25.
//

import Foundation

func solution101(_ array: [Int?]) -> Bool{
    let root = initTreeNodeWithArray(array: array)
    return mirror(root?.left, root?.right)
}

func mirror(_ leftTreeNode: TreeNode?, _ rightTreeNode: TreeNode?) -> Bool {
    if leftTreeNode == nil && rightTreeNode == nil {
        return true
    }
    if leftTreeNode == nil || rightTreeNode == nil {
        return false
    }
    
    return leftTreeNode?.val == rightTreeNode?.val && mirror(leftTreeNode?.left, rightTreeNode?.right) && mirror(leftTreeNode?.right, rightTreeNode?.left)
}

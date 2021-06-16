//
//  LC111 二叉树的最小深度.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/6/15.
//

import Foundation

func solution111(node: TreeNode) -> Int {
    let depth = 1
    return helper111(treeNode: node, depth: depth)
}

func helper111(treeNode: TreeNode?, depth: Int) -> Int {
    var left = treeNode?.left, right = treeNode?.right
    if left == nil && right == nil {
        return depth
    }
    
    var leftDepth = 0
    var rightDepth = 0
    if left != nil {
         leftDepth = helper111(treeNode: left, depth: depth + 1)
    }
    if right != nil {
         rightDepth = helper111(treeNode: right, depth: depth + 1)
    }
    
    if left != nil && right != nil {
        return min(leftDepth, rightDepth)
    } else {
        return max(leftDepth,rightDepth)
    }
}

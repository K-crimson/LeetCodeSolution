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

/// BFS方法：

func solution111BFS(root: TreeNode?) -> Int {
    guard let rootNode = root else {
        return 0
    }
    
    var queue = [TreeNode]()
    queue.append(rootNode)
    
    var depth = 1
    while !queue.isEmpty {
        var queueCount = queue.count
        for _ in 1...queueCount {
            let outNode = queue.removeFirst()
            if outNode.left == nil && outNode.right == nil {
                return depth
            }
            if let left = outNode.left {
                queue.append(left)
            }
            if let right = outNode.right {
                queue.append(right)
            }
        }
        depth += 1
    }

    return depth
}



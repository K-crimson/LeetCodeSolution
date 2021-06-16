//
//  LC102 二叉树的层序遍历.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/6/15.
//

import Foundation

func solution102(root: TreeNode?) -> [[Int]] {
    
    guard let node = root else { return [] }
    
    return helper102(treeNode: node)
}



func helper102(treeNode: TreeNode?) -> [[Int]] {
    var queue = [TreeNode]()
    guard let node = treeNode else { return [] }
    queue.append(node)
    
    var result = [[Int]]()
    while !queue.isEmpty {
        var level = [Int]()
        let levelCount = queue.count
        for _ in 1...levelCount {
            let outNode = queue.removeFirst()
            level.append(outNode.val)
            if outNode.left != nil {
                queue.append(outNode.left!)
            }
            if outNode.right != nil {
                queue.append(outNode.right!)
            }
        }
        result.append(level)
    }
    
    return result
    
}

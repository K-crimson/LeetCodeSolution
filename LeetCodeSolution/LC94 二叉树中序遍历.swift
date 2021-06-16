//
//  LC94 二叉树中序遍历.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/5/30.
//

import Foundation

// 递归：
func solution94(_ root: TreeNode?) -> [Int] {
    var nums = [Int]()
    help(root, &nums)
    return nums
}

func help(_ root: TreeNode?, _ nums: inout [Int]) {
    guard let root = root else {
        return
    }
    help(root.left, &nums)
    nums.append(root.val)
    help(root.right, &nums)
    
}

//非递归：

func solution94method2(_ root: TreeNode?)  -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    while !stack.isEmpty || node != nil{
        if  node != nil {
            stack.append(node!)
            node = node?.left
        } else {
            node = stack.removeLast()
            res.append(node!.val)
            node = node!.right
        }
    }
    
    return res
}

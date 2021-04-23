//
//  TreeNode.swift
//  Leetcode
//
//  Created by 车致远 on 2021/4/23.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    
    init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    init(_ val: Int) {
        self.val = val
    }
    init(_ val: Int, _ left: TreeNode, _ right: TreeNode) {
        self.val = val
        self.left = left
        self.right = right
    }
    
}


func initTreeNodeUseArray(array: [Int?]) -> TreeNode? {
    // 对每一个Int元素创建一个对应的树叶节点
    let nodes = array.map { $0 == nil ? nil : TreeNode($0!) }
    // 标记变量，标记当前的树叶是否被填满，0表示未填充，2表示左右子树均已填充
    var flag = [Int](repeating: 0, count: array.count)
    guard let root = nodes.first else { return nil }
    // 对除了根节点以外的节点进行遍历
    for (index, node) in nodes.dropFirst().enumerated() {
        // 找到第一个没有被填满的树叶
        if let firstNodeIndex = flag.firstIndex(where: { $0 != 2 }) {
            // 如果标记变量为1，把当前的遍历节点作为左子树，同时更新填充标记
            if flag[firstNodeIndex] == 0 {
                nodes[firstNodeIndex]?.left = node
                flag[firstNodeIndex] = 1
            } else { // 否则作为右子树
                nodes[firstNodeIndex]?.right = node
                flag[firstNodeIndex] = 2
            }
            // 空节点不需要再填充叶子，直接标记为已填满
            if node == nil {
                flag[index + 1] = 2
            }
        }
    }
    return root
}

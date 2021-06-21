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
    ///用栈实现的前序遍历
    func preorderTraversal() {
        var res = [Int]()
        var stack = [TreeNode]()
        var node: TreeNode?
        node = self
                
        while !stack.isEmpty || node != nil {
            if node != nil {
              res.append(node!.val)
              stack.append(node!)
              node = node!.left
            } else {
              node = stack.removeLast().right
            }
        }
        print(res)
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



/// 使用层序遍历打印出二叉树
func printTreeNode(_ treeNode: TreeNode?) {
    var res = [[Int]]()
    var queue = [TreeNode]()
    if let root = treeNode {
        queue.append(root)
    }
    while queue.count > 0 {
        let size = queue.count
        var level = [Int]()
        for _ in 0 ..< size {
            let node = queue.removeFirst()
            level.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        res.append(level)
    }
    print(res)
}


//附： 二叉树遍历方法整理

//1. 前序遍历
//: 前序遍历，递归实现
func preOrderTraversal_RE(root: TreeNode?) -> [Int] {
    var res = [Int]()
    _preHelper(root, &res)
    return res
}
// 辅助方法
func _preHelper(_ node: TreeNode?, _ res: inout [Int]) {
    guard let node = node else {return}
    res.append(node.val)
    _preHelper(node.left, &res)
    _preHelper(node.right, &res)
}

/// 非递归 使用栈实现
func preOrderTraversal(root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]() //辅助栈，存放节点。
    var node = root
    while !stack.isEmpty || node != nil {
        if node != nil {
            res.append(node!.val)
            stack.append(node!)
            node = node!.left
        } else {
            node = stack.removeLast().right
        }
    }
    return res
}

/// 迭代法
func preOrderTraversal(_ root: TreeNode?) -> [Int] {
    guard let node = root else { return [] }
    var res = [Int]()
    var stack = [TreeNode]()
    stack.append(node)
    while !stack.isEmpty {
        let popNode = stack.popLast()!
        if let right = popNode.right {
            stack.append(right)
        }
        if let left = popNode.left {
            stack.append(left)
        }
        res.append(popNode.val)
    }
    return res
}


//2. 中序遍历

//: 中序遍历，递归实现
func inOrderTraversal_RE(root: TreeNode?) -> [Int] {
    var nums = [Int]()
    _inHelper(root, &nums)
    return nums
}
// 辅助方法
func _inHelper(_ node: TreeNode?, _ nums: inout [Int]) {
    guard let node = node else {return}
    _inHelper(node.left, &nums)
    nums.append(node.val)
    _inHelper(node.right, &nums)
}
//: 中序遍历, 非递归实现
func inOrderTraversal(root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    while !stack.isEmpty || node != nil {
        if node != nil {
            stack.append(node!)
            node = node!.left
        } else {
            node = stack.removeLast()
            res.append(node!.val)
            node = node!.right
        }
    }

    return res
}


//3 后序遍历
//: 后序遍历递归
func postOrderTraversal_RE(_ root: TreeNode?) -> [Int] {
    var nums = [Int]()
    _postHelper(root, &nums)
    return nums
}
func _postHelper(_ node: TreeNode?, _ nums:inout [Int]){
    guard let node = node else {return}
    _postHelper(node.left, &nums)
    _postHelper(node.right, &nums)
    nums.append(node.val)
}

//: 后序遍历非递归
func postOrderTraversal(root: TreeNode?) -> [Int] {

    var res = [Int]()
    var stack = [TreeNode]()
    var tagStack = [Int]()
    var node = root

    while !stack.isEmpty || node != nil {

        while node != nil {
            stack.append(node!)
            tagStack.append(0)
            node = node!.left
        }
        while !stack.isEmpty && tagStack.last! == 1 {
            tagStack.removeLast()
            res.append(stack.removeLast().val)
        }
        // 访问左子树到头，访问右子树
        if !stack.isEmpty {
            tagStack.removeLast()
            tagStack.append(1)
            node = stack.last!.right
        }
    }
    return res
}


// 深度优先搜索： 同前序遍历


// 广度优先搜索：

func BFS(root: TreeNode?) -> [Int] {
    
    guard let node = root else { return [] }
    
    return BFSHelper(treeNode: node)
}

func BFSHelper(treeNode: TreeNode?) -> [Int] {
    var queue = [TreeNode]()
    guard let node = treeNode else { return [] }
    queue.append(node)
    
    var result = [Int]()
    while !queue.isEmpty {
        let outNode = queue.removeFirst()
        result.append(outNode.val)
        if outNode.left != nil {
            queue.append(outNode.left!)
        }
        if outNode.right != nil {
            queue.append(outNode.right!)
        }
    }
    
    return result
    
}



/// 迭代法 统一格式写法：

//前序遍历：
func preOrderIteration(_ root: TreeNode?) -> [Int] {
    
    guard let root = root else { return [] }
    
    var res = [Int]()
    var stack = [TreeNode?]()
    var node: TreeNode? = root
    stack.append(node)                      // 根节点
    while !stack.isEmpty {
        node = stack.last!                  // 取栈顶的节点
        if node != nil {
            node = stack.removeLast()       // 取栈顶的节点并pop
            if let right = node?.right {
                stack.append(right)         //右
            }
            if let left = node?.left {
                stack.append(left)          //左
            }
            stack.append(node)              //中
            stack.append(nil)               //压入nil作为待处理标识
        } else {
            stack.removeLast()              //弹出nil
            node = stack.removeLast()       //取待处理节点
            res.append(node!.val)           //将待处理节点加入结果数组
        }
    }
    return res
}

func postorderIteration(_ root: TreeNode?) -> [Int] {
    guard let root = root else {return []}
    var res = [Int]()
    var stack = [TreeNode?]()
    var node: TreeNode? = root
    stack.append(node!)
    while !stack.isEmpty {
        node = stack.removeLast()
        if node != nil {
            stack.append(node!)
            stack.append(nil)
            if let right = node!.right {
                stack.append(right)
            }
            if let left = node!.left {
                stack.append(left)
            }
        } else {
            node = stack.removeLast()
            res.append(node!.val)
        }
    }
    return res
}

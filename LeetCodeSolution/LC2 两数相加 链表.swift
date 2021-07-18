//
//  LC2 两数相加 链表.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/16.
//

import Foundation
func solution2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var node1 = l1, node2 = l2
    var carry = 0
    let result = ListNode()
    var lastNode: ListNode? = result
    while node1 != nil || node2 != nil {
        var num = (node1?.val ?? 0) + (node2?.val ?? 0) + carry
        carry = 0
        if num >= 10 {
            carry = 1
            num = num - 10
        }
        lastNode?.val = num
        if node1?.next != nil || node2?.next != nil {
            let node = ListNode()
            lastNode?.next = node
            lastNode = node
        }
        node1 = node1?.next
        node2 = node2?.next
    }
    if carry != 0 {
        let node = ListNode(carry)
        lastNode?.next = node
    }
    
    return result
}

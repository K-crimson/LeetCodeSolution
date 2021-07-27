//
//  LC19 删除链表中倒数第n结点.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/27.
//

import Foundation

func solution19(_ head: ListNode?, _ n: Int) -> ListNode? {
    var node = head
    var arr = [ListNode]()
    while node != nil {
        arr.append(node!)
        node = node!.next
    }
    let count = arr.count ?? 0
    if arr.isEmpty || arr.count == 1 {
        return nil
    }

    if count - n + 1 > count - 1 {
        arr[count - n - 1].next = nil
    }  else {
        arr[count - n - 1].next = arr[count - n + 1]
    }

    return arr.first!
}

func solution19DoubleIndicator(_ head: ListNode?, _ n: Int) -> ListNode? {
    var preNode = ListNode(0, head!)
            
    var left = preNode, right: ListNode? = preNode
    for _ in 1...n + 1 {
        right = right?.next
    }
    while right != nil {
        left = left.next!
        right = right?.next
    }
    left.next = left.next?.next
    return preNode.next
}

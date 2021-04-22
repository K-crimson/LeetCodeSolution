//
//  LC21. 合并两个有序链表 链表.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/4/22.
//

import Foundation

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var list1 = l1
    var list2 = l2
    let prehead = ListNode(-1)
    var prev = ListNode()

    prev = prehead

    while list1 != nil && list2 != nil {
        if list1!.val <= list2!.val {
            prev.next = list1
            list1 = list1?.next
        } else {
            prev.next = list2
            list2 = list2?.next
        }
        prev = prev.next!
    }
    prev.next = list1 ?? list2
    return prehead.next

}

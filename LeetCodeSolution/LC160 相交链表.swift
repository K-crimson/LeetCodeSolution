//
//  LC160 香蕉链表.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/6/23.
//

import Foundation
func getIntersectionNode160(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil {
        return nil
    }
    var nodeA = headA, nodeB = headB
    while nodeA !== nodeB {
        nodeA = nodeA == nil ? headB : nodeA!.next
        nodeB = nodeB == nil ? headA : nodeB!.next
    }
    return nodeA
}

func getIntersectionNodeHash160(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil {
        return nil
    }
    var nodeA = headA, nodeB = headB
    var hash = Set<ListNode>()
    while nodeA != nil {
        hash.insert(nodeA!)
        nodeA = nodeA?.next
    }
    while nodeB != nil {
        if hash.contains(nodeB!) {
            return nodeB
        }
        nodeB = nodeB?.next
    }
    return nil
}
    

extension ListNode: Hashable, Equatable {
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs === rhs
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(ObjectIdentifier(self))
    }
    
    
    
}

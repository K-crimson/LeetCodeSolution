//
//  ListNode.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/4/22.
//

import Foundation

class ListNode {
    var val: Int = 0
    var next: ListNode?
    init() {
        self.val = 0
        self.next = nil
    }
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    init(_ val: Int, _ next: ListNode) {
        self.val = val
        self.next = next
    }
    init(_ array: [Int]) {
        var head = ListNode()
        var tail = ListNode()
        tail = head
        for num in array {
            let tempNode = ListNode(num)
            tail.next = tempNode
            tail = tempNode
        }

        if let next = head.next {
            head = next
        }
        
        self.val = head.val
        self.next = head.next
    }
    
    
    func initFromTail(_ array: [Int]) -> ListNode{
        var headNode = ListNode(0)
        
        for num in array {
            let tempNode = ListNode()
            tempNode.val = num
            tempNode.next = headNode.next
            headNode.next = tempNode
        }
        if headNode.next != nil {
            headNode = headNode.next!
        }
        
        return headNode
    }
    

    func initFromHead(_ array: [Int]) -> ListNode {
        var head = ListNode()
        var tail = ListNode()
        tail = head
        for num in array {
            let tempNode = ListNode(num)
            tail.next = tempNode
            tail = tempNode
        }

        if let next = head.next {
            head = next
        }
        
        
        return head
    }
    
    func printListNode() {
        var listNode = self
        var result = [Int]()
        while listNode.next != nil {
            result.append(listNode.val)
            listNode = listNode.next!
            if listNode.next == nil {
                result.append(listNode.val)
            }
        }
        print(result)
    }
}


//
//  Topic_02_AddTwoNumbers.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation
/**
 * Definition for singly-linked list.
 */

class Topic_02_AddTwoNumbers : CommonOpsProtocol {
    func testCase() {
        print("https://leetcode.cn/problems/add-two-numbers/")
        
        let one_l1 = ListNode(9)
        let two_l1 = ListNode(9)
        let three_l1 = ListNode(9)
        
        one_l1.next = two_l1
        two_l1.next = three_l1
        
        let one_l2 = ListNode(9)
        let two_l2 = ListNode(9)
//        let three_l2 = ListNode(4)
    
        
        one_l2.next = two_l2
//        two_l2.next = three_l2
    
        let results0 = self.addTwoNumbers(one_l1, one_l2)
        
        self.printList(results0)
    }
    
    func printList(_ l: ListNode?) {
        var dummy = l
        while dummy != nil {
            print("node val: \(String(describing: dummy?.val))")
            dummy = dummy?.next
        }
    }

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
     
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        var h1 = l1
        var h2 = l2
        
        var temp: Int = 0
        var h3 = ListNode(0)
        let l3 = h3
        while h1 != nil || h2 != nil {
            var sum: Int = (h1?.val ?? 0) + (h2?.val ?? 0) + temp
            if sum < 10 {
                temp = 0
            } else {
                sum = sum - 10
                temp = 1
            }
            h1 = h1?.next
            h2 = h2?.next
            h3.val = sum
            if h1 != nil || h2 != nil || temp == 1 {
                h3.next = ListNode(temp)
                h3 = h3.next!
            }
        }
        return l3
    }
}

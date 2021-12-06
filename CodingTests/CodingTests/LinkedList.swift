//
//  LinkedList.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 06/12/21.
//

import Foundation

  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class ListNodeSolution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var nodeCount = 1
        var temp = head
        while temp?.next != nil {
            temp = temp?.next
            nodeCount = nodeCount + 1
        }
        let targetFromBegning = nodeCount - (n - 1)
        if targetFromBegning == 1 {
            return head?.next
        }
        if  targetFromBegning == 1 {
            head?.next = nil
            return head
        }
        var headNode = head
        var nodeIndex = 1
        
        while headNode?.next != nil, nodeIndex < targetFromBegning - 1 {
            headNode = headNode?.next
            nodeIndex = nodeIndex + 1
        }
        if  headNode?.next?.next != nil {
            headNode?.next = headNode?.next?.next
        } else {
            headNode?.next = nil
        }
        return head
    }
}

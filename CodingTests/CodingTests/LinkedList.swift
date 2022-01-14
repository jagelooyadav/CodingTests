//
//  LinkedList.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 06/12/21.
//

import Foundation

  public class ListNode {
      public var data: Int
      public var next: ListNode?
      public init() { self.data = 0; self.next = nil; }
      public init(_ val: Int) { self.data = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.data = val; self.next = next; }
 }

public class LinkList {
    var head: ListNode?
    var prev: ListNode?
    var array: [Int] = []
    init(array: [Int]) {
        self.array = array
        for element in array {
            if head == nil {
                head = ListNode.init(element)
                prev = head
            } else {
                let newNode = ListNode.init(element)
                prev?.next = newNode
                prev = newNode
            }
        }
    }
    
    func printList() {
        self.array = []
        var temp = head
        if let node = temp {
            self.array.append(node.data)
        }
        while temp?.next != nil {
            temp = temp?.next
            if let node = temp {
                self.array.append(node.data)
            }
        }
        print("data == \(array)")
    }
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
    
    func removeDuplicates(llist: ListNode?) -> ListNode? {
        var temp = llist
        var map: [Int: Int] = [:]
        map[temp?.data ?? 0] = 1
        
        while temp?.next != nil {
            if let elementCount = map[temp?.next?.data ?? 0] {
                map[temp?.next?.data ?? 0] = elementCount + 1
            } else {
               map[temp?.next?.data ?? 0] = 1
            }
            temp = temp?.next
        }
        print(map)
        var head = llist
        if let count = map[head?.data ?? 0], count > 1 {
            map[head?.data ?? 0] = count - 1
            head = head?.next
        }
        temp = head
        var prev: ListNode? = temp
        while temp?.next != nil {
            prev = temp
            temp = temp?.next
            if let count = map[temp?.data ?? 0], count > 1 {
              map[temp?.data ?? 0] = count - 1
              prev?.next = temp?.next
              temp = prev
            }
        }
        
        if let count = map[prev?.data ?? 0], count > 1 {
            prev?.next = nil
            map[prev?.data ?? 0] = count - 1
        }
        print(map)
         print("prev value == \(prev?.data ?? 0)")
        
    return head
    }
    
}

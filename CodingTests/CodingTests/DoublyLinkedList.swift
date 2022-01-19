//
//  DoublyLinkedList.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 19/01/22.
//

import Foundation

class DoublyLinkedListNode {
    let data: Int
    var next: DoublyLinkedListNode?
    var prev: DoublyLinkedListNode?
    
    init(data: Int) {
        self.data = data
    }
}

class DoublyLinkedListProblem {
    // Reverse Doubly linked list
    func reverse(llist: DoublyLinkedListNode?) -> DoublyLinkedListNode? {
        var lastNode = llist
        while lastNode?.next != nil {
            lastNode = lastNode?.next
        }
        let head = DoublyLinkedListNode(data: lastNode?.data ?? 0)
        var temp = head
        while lastNode?.prev != nil {
            lastNode = lastNode?.prev
            let newNode = DoublyLinkedListNode(data: lastNode?.data ?? 0)
            temp.next = newNode
            newNode.prev = temp
            temp = newNode
        }
        return head
    }
}

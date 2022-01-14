//
//  ViewController.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 26/11/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var ss = "1234".reversed()
        // Do any additional setup after loading the view.
        
        let list = LinkList.init(array: [3,
                                         3,
                                         3,
                                         4,
                                         5,
                                         5,])
        print(list.printList())
        let head = ListNodeSolution().removeDuplicates(llist: list.head)
        list.head = head
        list.printList()
        printHasCycle()
    }
    
    func printHasCycle() {
        let linkedList = LinkList(array: [1])
        let node2 = ListNode.init(2)
        linkedList.head?.next = node2
        let node3 = ListNode.init(3)
        node2.next = node3
        node3.next = node2
        print(ListNodeSolution().hasCycle(head: linkedList.head))
        
    }
}


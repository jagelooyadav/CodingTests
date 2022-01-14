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
    }
}


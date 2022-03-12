//
//  ViewController.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 26/11/21.
//

import UIKit
import CloudKit

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
        printHasCycle()
        print(removeDuplicate(str: "abccbad"))
        print(findLongestUniqueSubString(string: "abccbaddmghijk"))
        //print(StringProblem().findLongestUniqueSubString(in: "abccbaddmghijk"))
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
    
    func removeDuplicate(str: String) -> String {
        var data: [String] = []
        var map: [String: String] = [:]
        
        for element in str {
            if let element = map[String(element)] {
                print("duplecte element == \(element)")
            } else {
                map[String(element)] = String(element)
                data.append(String(element))
            }
        }
        return data.joined()
    }
    
    func findLongestUniqueSubString(string: String) -> String {
        var result = ""
        // ABC
        for i in 0...string.count - 1 {
            for j in i...string.count - 1 {
                if isDictinct(string: string, from: i, to: j) {
                    let temp = subString(from: i, to: j, string: string)
                    if temp.count > result.count {
                        result = temp
                    }
                }
            }
        }
        return result
    }
    
    func subString(from: Int, to: Int, string: String) -> String {
        let startIndex = string.index(string.startIndex, offsetBy: from)
        let endIndex = string.index(string.startIndex, offsetBy: to)
        let subString = string[startIndex...endIndex]
        var dd = String(subString)
        //dd.removeSubrange(<#T##Range<String.Index>#>)
        return String(subString)
    }
    
    func isDictinct(string: String, from: Int, to: Int) -> Bool {
        let substring = subString(from: from, to: to, string: string)
        var duplicateEntry: [String: String] = [:]
        for element in substring {
            if let savedEntry = duplicateEntry[String(element)] {
                print("allready saved == \(savedEntry)")
                return false
            } else {
                duplicateEntry[String(element)] = String(element)
            }
        }
        return true
    }
}


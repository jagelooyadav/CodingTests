//
//  Tree.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 21/01/22.
//

import Foundation

class TreeNode {
    
    let data: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(data: Int) {
        self.data = data
    }
}

class TreeTraverseDFS {
    func printInOrder(node: TreeNode?) {
        if node == nil {
            return
        }
        
        printInOrder(node: node?.left)
        print(node?.data ?? "No Node data")
        printInOrder(node: node?.right)
    }
    
    func printPreOrder(node: TreeNode?) {
        if node == nil {
            return
        }
        print(node?.data ?? "No Node data")
        printPostOrder(node: node?.left)
        printPostOrder(node: node?.right)
    }
    
    func printPostOrder(node: TreeNode?) {
        if node == nil {
            return
        }
        
        printPostOrder(node: node?.left)
        printPostOrder(node: node?.right)
        print(node?.data ?? "No Node data")
    }
}

// level wise
class TreeTraverseBFS {
    
    func printLevelWise(node: TreeNode?) {
        let height = height(node: node)
        
        for index in 1...height {
            printCurrentlevel(node: node, level: index)
        }
    }
    
    func printCurrentlevel(node: TreeNode?, level: Int) {
        if node == nil {
            return
        }
        if level == 1 {
            print(node?.data ?? "No data")
        } else if level > 1 {
            printCurrentlevel(node: node?.left, level: level - 1)
            printCurrentlevel(node: node?.right, level: level - 1)
        }
    }
    
    func height(node: TreeNode?) -> Int {
        if node == nil {
            return -1
        } else {
            let leftHeight = height(node: node?.left)
            let rightHeight = height(node: node?.right)
            if leftHeight > rightHeight {
                return leftHeight + 1
            } else {
                return rightHeight + 1
            }
        }
    }
    
    func isBST(node: TreeNode?) -> Bool {
        
        return isBSTUtil(node: node, min: Int.min, max: Int.max)
    }
    
    func isBSTUtil(node: TreeNode?, min: Int, max: Int) -> Bool {
        guard let node = node else {
            return true
        }

        
        if node.data < min || node.data > max {
            return false
        }
        return isBSTUtil(node: node.left, min: min, max: node.data - 1) && isBSTUtil(node: node.right, min: node.data + 1, max: max)
        
    }
}

//
//  StringProblem.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 27/01/22.
//

import Foundation

class StringProblem {
    // Find longest unique substring in a given string
    func findLongestUniqueSubString(in string: String) -> String {
        
        func subString(string: String, from: Int, to: Int) -> String {
            let startIndex = string.index(string.startIndex, offsetBy: from)
            let endIndex = string.index(string.startIndex, offsetBy: to)
            return String(string[startIndex...endIndex])
        }
        
        func isUnique(string: String, from: Int, to: Int) -> Bool {
            let subString = subString(string: string, from: from, to: to)
            if subString.count == Set(subString).count {
                return true
            }
            return false
        }
        
        
        var result = ""
        for i in 0...string.count - 1 {
            for j in i...string.count - 1 {
                if isUnique(string: string, from: i, to: j) {
                    let substring = subString(string: string, from: i, to: j)
                    if result.count < substring.count {
                        result = substring
                    }
                }
            }
        }
        return result
    }
}

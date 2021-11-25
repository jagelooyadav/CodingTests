//
//  BinarySearch.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 26/11/21.
//

import Foundation

class BinarySearch {
    func searchUsingBinary(array: [Int], target: Int) -> Int {
        return performSearch(array: array, target: target, lower: 0, upper: array.count-1)
    }
    
    private func performSearch(array: [Int], target: Int, lower: Int, upper: Int) -> Int {
        if array.isEmpty {
            return -1
        }
        guard upper >= lower else { return -1 }
        
        let mid = lower + (upper-lower)/2
        if array[mid] == target {
            return mid
        }
        if  target < array[mid] {
            return performSearch(array: array, target: target, lower: lower, upper: mid-1)
        } else {
            return performSearch(array: array, target: target, lower: mid+1, upper: upper)
        }
    }
}

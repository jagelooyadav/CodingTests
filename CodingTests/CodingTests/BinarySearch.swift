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

class Solution {
    let badVersion = 1702766719
    func isBadVersion(_ version: Int) -> Bool {
        return badVersion == version || version > badVersion
    }
    
    func firstBadVersion(_ n: Int) -> Int {
        var beg: Int
        var last: Int
        var mid: Int;
        beg = 1
        last = n;
        var pos: Int = 1;
        while beg<=last {
            // ensure you calculate mid values this way ,otherwise ,it would cause overflow
            mid = beg + (last-beg)/2;
            let x = isBadVersion(mid);
            if x == true {
                pos = mid;
                last = mid-1;
            } else {
                beg = mid+1
            }
        }
        
        // return the first index of faulty product
        return pos
    }
    
    // 1,2
    
    
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
            let count = nums.count
            var lower = 0
            var upper = count - 1
            var position = -1
            
            while upper >= lower {
                let mid = lower + (upper - lower)/2
                
                position = mid
                
                if nums[mid] == target {
                    position = mid
                    return position
                }
                
                if target < nums[mid]  {
                    upper = mid - 1
                    if mid-1 > 0, target > nums[mid-1] {
                        return mid
                    }
                    if mid - 1 < 0 {
                        return 0
                    }
                } else {
                    lower = mid + 1
                    if mid+1 < nums.count, target < nums[mid+1] {
                        return mid+1
                    }
                    if mid+1 >= nums.count {
                        return mid + 1
                    }
                }
            }
            return position
        }
}

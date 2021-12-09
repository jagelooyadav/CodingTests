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
                } else if target < nums[mid]  {
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
    
    ///Find First and Last Position of Element in Sorted Array
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
            let first = binarySearch(nums: nums, isFromBegining: true, target: target)
            let second = binarySearch(nums: nums, isFromBegining: false, target: target)
            return [first, second]
        }
        
        func binarySearch(nums: [Int], isFromBegining: Bool, target: Int) -> Int {
            if nums.count == 0 {
                return -1
            }
            
            var low = 0
            var high = nums.count - 1
            var result = -1
            while high >= low {
                let mid = low + (high - low)/2
                if nums[mid] == target {
                    result = mid
                    if isFromBegining {
                        high = mid - 1
                    } else {
                        low = mid + 1
                    }
                } else if target < nums[mid] {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
            return result
        }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let items = matrix.flatMap { $0 }
        
        var low = 0
        var high = items.count - 1
        
        while high >= low {
            let mid = low + (high - low)/2
            if items[mid] == target {
                return true
            }
            if target < items[mid] {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        
        return false
    }
}

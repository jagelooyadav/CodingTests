//
//  ArrayProblem.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 05/02/22.
//

import Foundation

class ArrayProblem {
    func solve(arr: [Int]) -> Int {
        var count = 0
        for i in 0...arr.count - 1 {
            let next = i + 1
            guard next <= arr.count - 1 else { continue }
            for j in next...arr.count - 1 {
                if i < j, arr[i] * arr[j] < max(i: i, j: j, array: arr){
                    count  = count + 1
                }
            }
        }
        return count
    }

    func max(i: Int, j: Int, array: [Int]) -> Int {
        var max = array[i]
        for index  in i...j {
            if max < array[index] {
                max = array[index]
            }
        }
        return max
    }
}

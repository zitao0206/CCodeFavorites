//
//  main.swift
//  ALProgramming
//
//  Created by lizitao on 2023/2/4.
//

import Foundation

class Opera_Test01 : CommonOpsProtocol {
    
    func testCase() {
        var A = [2, 1, 2, 3, 2, 2]
        let R = 3
        let res = solution(&A, R)
        
        print(res)
        
    }
    
    // from chatGPT
    func solution(_ A: inout [Int], _ R: Int) -> Int {
        
        var distinctCount = 0
        
        // save all the kinds of stores
        var distinct = Set<Int>()
        
        for i in 0..<R {
            distinct.insert(A[i])
        }
        
        distinctCount = distinct.count
        
        var maxCount = distinctCount

        for i in R..<A.count {
            let leftShelf = A[i - R]
            let rightShelf = A[i]
            if leftShelf != rightShelf {
                distinct.remove(leftShelf)
            }
            distinct.insert(rightShelf)
            maxCount = max(maxCount, distinct.count)
            if maxCount == R {
                return maxCount
            }
        }
        return maxCount
    }

    
}







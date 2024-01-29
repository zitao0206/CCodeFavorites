//
//  main.swift
//  ALProgramming
//
//  Created by lizitao on 2023/2/4.
//

import Foundation
// from https://app.codility.com/
class Opera_Test00 : CommonOpsProtocol {
    
    func testCase() {
        let res = solution(1, 100)
        print(res)
    }

    public func solution(_ A: Int, _ B: Int) -> Int {

        
        func countPieces(_ length: Int, _ stick1: Int, _ stick2: Int) -> Int {
            return (stick1 / length) + (stick2 / length)
        }

        func canFormSquare(_ length: Int, _ stick1: Int, _ stick2: Int) -> Bool {
            return countPieces(length, stick1, stick2) >= 4
        }

        for length in stride(from: max(A, B), through: 1, by: -1) {
            if canFormSquare(length, A, B) {
                return length
            }
        }

        return 0
    }
    
   
    


    
}







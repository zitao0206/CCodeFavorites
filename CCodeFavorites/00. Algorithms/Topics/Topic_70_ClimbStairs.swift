//
//  Topic_70_climbStairs.swift
//  Programming
//
//  Created by lizitao on 2023/3/10.
//

import Foundation

class Topic_70_ClimbStairs : CommonOpsProtocol {
    func testCase() {
        let n = 4;
        print(climbStairs00(n))
        
    }
    func climbStairs(_ n: Int) -> Int {
        guard n > 0 else {
            fatalError("error input")
        }
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        let result = climbStairs(n-1) + climbStairs(n-2)
        return result
    }
    
    func climbStairs00(_ n: Int) -> Int {
       if n == 1 {
           return 1
       }
       if n == 2 {
           return 2
       }
       var dp = [Int](repeating: 0, count: n+1)
       dp[0] = 1
       dp[1] = 1
       for i in 2...n {
           dp[i] = dp[i-1] + dp[i-2]
       }
       return dp[n]
   }
}

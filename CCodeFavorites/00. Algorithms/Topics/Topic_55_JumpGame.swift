//
//  Topic_55_JumpGame.swift
//  Programming
//
//  Created by lizitao on 2023/3/13.
//

import Foundation
class Topic_55_JumpGame : CommonOpsProtocol {
    func testCase() {
        let s = [-2,1,-3,4,-1,2,1,-5,4]
        
        let res = canJump(s)
        
        print(res)
        
    }
    
    func canJump(_ nums: [Int]) -> Bool {
        var dp = [Bool](repeating: false, count: nums.count)
        dp[0] = true
        
        for i in 1..<nums.count {
            for j in (0..<i).reversed() {
                if dp[j] && j + nums[j] >= i {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[nums.count - 1]
    }
}

//
//  Topic_53_Maximum Subarray.swift
//  Programming
//
//  Created by lizitao on 2023/3/13.
//

import Foundation
class Topic_53_Maximum : CommonOpsProtocol {
    func testCase() {
        let s = [-2,1,-3,4,-1,2,1,-5,4]
        
        let res = maxSubArray(s)
        
        print(res)
        
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var maxSum = dp[0]
        
        for i in 1..<nums.count {
            dp[i] = max(dp[i-1] + nums[i], nums[i])
            maxSum = max(maxSum, dp[i])
        }
        
        return maxSum
    }
    

}

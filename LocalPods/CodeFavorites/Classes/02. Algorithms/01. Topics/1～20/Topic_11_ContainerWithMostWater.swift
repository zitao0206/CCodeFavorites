//
//  Topic_11_ContainerWithMostWater.swift
//  CodeFavorites
//
//  Created by lizitao on 2023-10-15.
//

import Foundation

class Topic_11_ContainerWithMostWater : CommonOpsProtocol {
    
    func testCase() {
        print("https://leetcode.cn/problems/container-with-most-water/")
        let x = [1,8,6,2,5,4,8,3,7]
        let result = maxArea(x)
        print(result)
    }

    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var left = 0
        var right = height.count - 1
        
        while left < right {
            let h = min(height[left], height[right])
            maxArea = max(maxArea, (right - left) * h)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
    
}

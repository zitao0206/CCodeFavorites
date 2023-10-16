//
//  Topic_15_ThreeSum.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation

class Topic_15_ThreeSum : CommonOpsProtocol {
    func testCase() {
        let nums = [-1,0,1,2,-1,-4]
        let results = threeSum(nums)
        print(results)
    }

    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return []
        }
        var solutions = [[Int]]();
        let sorted = nums.sorted() { $0 < $1 }
        let count = sorted.count
        var i = 0
        print(sorted)
         
        while (i < count - 2) {
            if (i == 0 || (i > 0 && sorted[i] != sorted[i - 1])) {
                var left = i + 1
                var right = count - 1
                let num = sorted[i]
                while (left < right) {
                    let currentSum = sorted[left] + sorted[right] + num
                    if currentSum == 0 {
                        solutions.append([sorted[left], sorted[right], num])
                        while (left < right && sorted[left] == sorted[left + 1]) {
                            left += 1
                        }
                        while (left < right && sorted[right] == sorted[right - 1]) {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if currentSum < 0 {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
            i += 1
        }
        return solutions
    }
    
    
    func threeSum_01(_ nums: [Int]) -> [[Int]] {
        
        var result: [[Int]] = []
        let nums = nums.sorted()

        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var left = i + 1
            var right = nums.count - 1

            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return result
    }

    // 示例 1
    let nums1 = [-1,0,1,2,-1,-4]
    print(threeSum(nums1)) // Output: [[-1, -1, 2], [-1, 0, 1]]

    // 示例 2
    let nums2 = [0,1,1]
    print(threeSum(nums2)) // Output: []

    // 示例 3
    let nums3 = [0,0,0]
    print(threeSum(nums3)) // Output: [[0, 0, 0]]

}



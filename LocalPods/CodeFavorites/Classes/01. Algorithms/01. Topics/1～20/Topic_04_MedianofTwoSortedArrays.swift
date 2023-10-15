//
//  Topic_04_MedianofTwoSortedArrays.swift
//  Programming
//
//  Created by lizitao on 2023/2/23.
//

import Foundation

class Topic_04_MedianofTwoSortedArrays : CommonOpsProtocol {
    
    
    func testCase() {
        print("https://leetcode.cn/problems/median-of-two-sorted-arrays/")
        
        let nums1 = [1, 3]
        let nums2 = [2]
        let length = findMedianSortedArrays(nums1, nums2)
        print(length)
    }
    
    //From myself
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let a = [nums1, nums2].flatMap({ $0 })
        let b = a.sorted(by: {$0 < $1})
        print(b)
        let kCount = b.count
        if kCount % 2 == 0 {
            let i = kCount / 2
            return Double(Double(b[i] + b[i+1]) / 2.0)
        } else {
            let i = kCount / 2
            return Double(b[i])
        }
    }
    
    func findMedianSortedArrays_01(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var nums = nums1 + nums2
        
        nums.sort()
        
        let n = nums.count
        
        if n % 2 == 0 {
            
            return Double(nums[n / 2 - 1] + nums[n / 2]) / 2.0
            
        } else {
          
            return Double(nums[n / 2])
        }
        
    }
}

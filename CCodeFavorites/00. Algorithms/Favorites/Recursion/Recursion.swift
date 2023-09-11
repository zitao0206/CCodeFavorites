//
//  Topic_283_MoveZeroes.swift
//  Programming
//
//  Created by lizitao on 2023/2/27.
//

import Foundation

class Recursion : CommonOpsProtocol {
    func testCase() {
        
        let a = 5
        let b = 3
        let c = add(a, b)
        print(c)
        
        let d = 3, e = 9
        print(multiply(d, e))
        
        let arr = [7,5,6,4,1]
        let res = reversePairs(arr)
        print(res)
        
    }
    
    func reversePairs(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return 0
        }
        if nums.count == 2 {
            if nums[0] > nums[1] {
                return 1
            } else {
                return 0
            }
        }
        let lastValue = nums[nums.count - 1]
        var result = 0
        for obj in nums.dropLast() {
            if obj > lastValue {
                result += 1
            }
        }
        let arr = Array(nums[0...nums.count - 2])
        result += reversePairs(arr)
        return result
    }
    
    func multiply(_ A: Int, _ B: Int) -> Int {
        if A == 1 {
            return B
        }
        if B == 1 {
            return A
        }
        let a = min(A, B)
        let b = max(A, B)
        return b + multiply(a - 1, b)
        
    }
    
    func add(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let carry = a & b // 按位与操作，获取进位的值
            a = a ^ b // 按位异或操作，获取无进位的值
            b = carry << 1 // 进位值左移一位，继续和 a 相加
            
        }
        
        return a
    }
   
    
}

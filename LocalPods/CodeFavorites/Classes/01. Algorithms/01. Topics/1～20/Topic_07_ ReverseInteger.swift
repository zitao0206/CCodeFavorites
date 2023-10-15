//
//  Topic_07_ Reverse Integer.swift
//  Topics
//
//  Created by lizitao on 2022/12/12.
//

import Foundation
class Topic_07_ReverseInteger : CommonOpsProtocol {
    func testCase() {
        print("https://leetcode.cn/problems/reverse-integer/")
        let x = 1534236469
        let result = reverse(x)
        print(result)
    }
    
    //From myself
    func reverse(_ x: Int) -> Int {
        var isNegtive: Bool = false
        var xValue = x
        if x < 0 {
            isNegtive = true
            xValue = abs(x)
        }
        let xNumber = xValue as NSNumber
        let xString : String = xNumber.stringValue
        var rString = ""
        for ch in xString.reversed() {
            rString.append(ch)
        }
        var result = (rString as NSString).integerValue
        
        if !isNegtive && result >= Int32.max {
            result = 0
        }
        if isNegtive && result > Int32.max {
            result = 0
        }
        
        if isNegtive {
            result = -result
        }
        return result
    }
    
    func reverse_01(_ x: Int) -> Int {
        var result = 0
        var num = x
        while num != 0 {
            let digit = num % 10
            num /= 10
            if result > Int32.max / 10 || (result == Int32.max / 10 && digit > 7) {
                return 0
            }
            if result < Int32.min / 10 || (result == Int32.min / 10 && digit < -8) {
                return 0
            }
            result = result * 10 + digit
        }
        return result
    }

    
}

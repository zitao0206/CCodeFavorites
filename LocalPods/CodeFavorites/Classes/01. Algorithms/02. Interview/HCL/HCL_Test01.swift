//
//  main.swift
//  ALProgramming
//
//  Created by lizitao on 2023/2/4.
//

import Foundation

class HCL_Test01 : CommonOpsProtocol {
    
    func testCase() {
        let inputString = "formaxamfor"
        let resultString = checkPalindrome(inputString: inputString)
        print(resultString) // ["axa", "maxam"]
    }
    
    func checkPalindrome(inputString: String) -> String {
        guard inputString.count > 2 else {
            return inputString
        }
        
        let tempStringArray = Array(inputString)
        
        let n = inputString.count
        
        var maxLength = 0
        
        for i in 0..<n {
            // firstSubString: 0..<i
            let firstSubString = ""
            
            // secondSubString: 0..<i+1
            let SecondSubString = ""
            
//            let length = max(firstSubString.length, SecondSubString.length)
          
        }
        
        return ""
    }
    
    func checkSubStringIsPalindrome(subString: String) -> Int {
        
        guard subString.count > 2 else {
            return subString.count
        }
        
        // if subString is a Palindrome, return its length
        // else return 0
        
        return 0
        
    }
    
    
}







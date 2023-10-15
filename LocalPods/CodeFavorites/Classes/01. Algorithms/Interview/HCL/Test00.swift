//
//  main.swift
//  ALProgramming
//
//  Created by lizitao on 2023/2/4.
//

import Foundation

class Test00 : CommonOpsProtocol {
    
    func testCase() {
//        let sourceArray = [5, 75, 325, 800, 375, 575, 300, 25, 925, 875]
        let userInput = [9, 6, 12, 15]
        let resultArray = identifyFactors(userInput: userInput)
        print(resultArray)
    }
    
    func identifyFactors(userInput: [Int]) -> [Int] {

        guard userInput.count > 1 else {
            return userInput
        }
        var resultArray: [Int] = []
        
        //1. find the min value
        
        let minValue = findMinValue(userInput)
        
        if minValue < 2 {
            return resultArray
        }
        
        //2. find all the factors of the min-value except the value 1
        // and store them into resultArray
        for value in 2..<minValue+1 {
            if vertifyFactorOf(userInput, targetValue: value) {
                resultArray.append(value)
            }
          
        }
  
        return resultArray
    }
    
    func vertifyFactorOf(_ sourceArray: [Int], targetValue: Int) -> Bool {
        
        guard sourceArray.count > 1 else {
            return false
        }
        guard targetValue > 1 else {
            return false
        }
        
        for originalValue in sourceArray {
            if originalValue % targetValue > 0 {
                return false
            }
        }
        return true
    }

    func findMinValue(_ sourceArray: [Int]) -> Int {
        
        guard sourceArray.count > 0 else {
            return 0
        }
            
        var minValue = sourceArray[0]
        
        for originalValue in sourceArray {
            if originalValue < minValue {
                minValue = originalValue
            }
        }
        return minValue
    }
    


    
}







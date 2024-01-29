//
//  main.swift
//  ALProgramming
//
//  Created by lizitao on 2023/2/4.
//

import Foundation

class Opera_Test02 : CommonOpsProtocol {
    
    func testCase() {
        var S = "1A 3C 2B 20G 5A"
        let N = 22
        let res = solution(N, &S)
        print(res)
        
    }
    
public func solution(_ N : Int, _ S : inout String) -> Int {

    // handle the empty case
    guard S.count > 0 else {
        return 2 * N
    }
    
    var number = 0
    // split the reserved seats
    let reservedSeats = S.split(separator: " ")
    
    // store all the seats information
    var seatsDict = [Int: [String]]()

    // store all the reserved seats into the dict
    for i in reservedSeats {
       let digital = Int(i.dropLast())!
       let letter = String(i.last!)
       if seatsDict[digital] == nil {
           seatsDict[digital] = [String]()
       }
       print(letter)
       seatsDict[digital]?.append(letter)
    }

    //traverse each row
    for n in 1...N {
        
       if seatsDict[n] == nil {
           // no reserved seats
           number += 2
           
       } else {
           let seats1 = ["B", "C", "D", "E"]
           let seats2 = ["F", "G", "H", "J"]
           let seats3 = ["D", "E", "F", "G"]
           var reservedSeats = seatsDict[n]!

           // check the 1st seat
           var flag1 = true
           for i in seats1 {
               if reservedSeats.contains(i) {
                   flag1 = false
                   break
               }
           }
           
           if flag1 {
               number += 1
               reservedSeats.append(contentsOf: ["B", "C", "D", "E"])
           }

           // check the 2rd seat
           var flag2 = true
           for i in seats2 {
               if reservedSeats.contains(i) {
                   flag2 = false
                   break
               }
           }
           if flag2 {
               number += 1
               reservedSeats.append(contentsOf: ["F", "G", "H", "J"])
           }

           // check the 3rd seat
           var flag3 = true
           for i in seats3 {
               if reservedSeats.contains(i) {
                   flag3 = false
                   break
               }
           }
           if flag3 {
               number += 1
           }
       }
    }
    return number
}

    
    
    
}







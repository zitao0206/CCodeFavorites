//
//  Topic_03_LongestSubstringWithoutRepeatingCharacters.swift
//  Topics
//
//  Created by lizitao on 2022/11/15.
//

import Foundation

class Topic_03_LongestSubstringWithoutRepeatingCharacters : CommonOpsProtocol {
    func testCase() {
        print("https://leetcode.cn/problems/longest-substring-without-repeating-characters/")
        let s = "abcabebb"
//        let s = "bbbb"
//        let s = "pwwkew"
//        let s = "aab"
//        let s = "dvdf"
        let length = lengthOfLongestSubstring(s)
        print(length)
    }
    
    //O(n) --- From myself
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        var result = 1
        var begin = 0
        var walkDict = [Character: Int]()
        
        for (i, ch) in s.enumerated() {
            if let index = walkDict[ch], index >= begin {
                begin = index + 1
            }
            walkDict[ch] = i
            result = max(result, i - begin + 1)
        }
        
        print(walkDict)
        return result
    }
    
    //O(n) --- From Others
    func lengthOfLongestSubstring02(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        var result = 1
        for (i, ch1) in s.enumerated() {
            for j in stride(from: i+1, through: s.count - 1, by: 1) {
                let ch2: Character = s[s.index(s.startIndex, offsetBy: j)]
                let length = j - i
                if ch2 == ch1 {
                    if result < length {
                        result = length
                    }
                    break
                }
            }
        }
        return result
    }
}

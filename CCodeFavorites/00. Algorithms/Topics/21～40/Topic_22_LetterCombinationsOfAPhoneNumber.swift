//
//  Topic_22_LetterCombinationsOfAPhoneNumber.swift
//  Programming
//
//  Created by lizitao on 2023/3/8.
//

import Foundation

class Topic_22_LetterCombinationsOfAPhoneNumber : CommonOpsProtocol {
    
    func testCase() {
        let n = 3
        let res = generateParenthesis(n)
        print(res)

    }
    
    // 生成有效括号的方法，返回一个字符串数组
    func generateParenthesis(_ n: Int) -> [String] {
        // 定义结果数组
        var res = [String]()
        // 调用递归方法生成括号序列
        generate(n, 0, 0, "", &res)
        // 返回结果数组
        return res
    }

    // 递归方法，生成括号序列
    func generate(_ n: Int, _ left: Int, _ right: Int, _ cur: String, _ res: inout [String]) {
        // 如果左右括号都用完了，把当前序列添加到结果数组中
        if left == n && right == n {
            res.append(cur)
            print(res)
            
            return
        }
        // 如果左括号还没用完，就加一个左括号
        if left < n {
            generate(n, left + 1, right, cur + "(", &res)
        }
        // 如果右括号少于左括号，就加一个右括号
        if right < left {
            generate(n, left, right + 1, cur + ")", &res)
        }
       
        
    }
    
    
    
}

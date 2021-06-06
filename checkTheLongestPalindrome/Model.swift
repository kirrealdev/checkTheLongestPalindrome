//
//  Model.swift
//  checkTheLongestPalindrome
//
//  Created by KirRealDev on 07.06.2021.
//

import Foundation

class Palindrome {
    static func checkTheLongest(inputStr: String) -> String {
        if(inputStr.isEmpty) {
            return "The string is empty"
        }
        
        var checkArr: [Character] = [Character](repeating: "#", count: (2 * inputStr.count) + 1)
        let inputStrArr: [Character] = Array(inputStr)
        
        for i in 0..<inputStrArr.count {
            checkArr[2 * i + 1] = inputStrArr[i]
        }
        
        var p: [Int] = [Int](repeating: 0, count: checkArr.count)
        var r, c, index, i_mir: Int
        var maxLen: Int = 1
        r = 0
        c = 0
        index = 0
        i_mir = 0
        
        var iter: Int = 1
        while (iter != checkArr.count - 1) {
            i_mir = (2 * c) - iter
            
            p[iter] = r > iter ? min(p[i_mir], r - iter) : 0
            
            while (iter > p[iter] && (iter + p[iter] + 1) < checkArr.count && checkArr[iter - p[iter] - 1] == checkArr[iter + p[iter] + 1]) {
                p[iter] = p[iter] + 1
            }
            
            if(p[iter] + iter > r) {
                c = iter
                r = iter + p[iter]
            }
            
            if(maxLen < p[iter]) {
                maxLen = p[iter]
                index = iter
            }
            iter = iter + 1
        }
        
        let lowerBound = inputStr.index(inputStr.startIndex, offsetBy: (index - maxLen) / 2)
        let upperBound = inputStr.index(inputStr.startIndex, offsetBy: ((index - maxLen) / 2) + maxLen - 1)
        
        return String(inputStr[lowerBound...upperBound])
    }
}

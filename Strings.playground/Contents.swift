//: Playground - noun: a place where people can play

import UIKit

func lengthOfLastWord(_ s: String) -> Int {
    var arr = s.components(separatedBy: " ")
    var newArr = [String]()
    
    for i in 0..<arr.count {
        if arr[i] != "" {
            newArr.append(arr[i])
        }
    }
    
    return newArr.last?.characters.count ?? 0
}

lengthOfLastWord(" all a ")

// HackerRank question: https://www.hackerrank.com/challenges/balanced-brackets

//3 - sample input/output
//{[()]} //YES
//{[(])} //NO
//{{[[(())]]}} //YES

//is it balanced? -- best way to do this is use stack?


func isBalanced(_ str: String) -> Bool {
    var strArr = str.characters
    returnf false
}


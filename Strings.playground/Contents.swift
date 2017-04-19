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

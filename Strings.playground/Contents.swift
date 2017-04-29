//: Playground - noun: a place where people can play

import UIKit

//*************************************************2
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

//lengthOfLastWord(" all a ")

//******************UNSOLVED*******************************3 HackerRank question: https://www.hackerrank.com/challenges/balanced-brackets

//3 - sample input/output
//{[()]} //YES
//{[(])} //NO
//{{[[(())]]}} //YES

//is it balanced? -- best way to do this is use stack?


//func isBalanced(_ str: String) -> Bool {
//    var strArr = str.characters
//    returnf false
//}


//*************************************************4 [Leet code - 557. Reverse Words in a String III]
/*
 Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
 
 Example 1:
 Input: "Let's take LeetCode contest"
 Output: "s'teL ekat edoCteeL tsetnoc"
 Note: In the string, each word is separated by single space and there will not be any extra space in the string.
 */

func reverseLetters(_ s: String) -> String {
    let arr = Array(s.characters).reversed()
    var string = String()
    
    for char in arr {
        string += String(char)
    }
    
    
    return string
}


func reverseWords(_ s: String) -> String {
    let wordArr = s.components(separatedBy: " ")
    var newString = String()
    
    for i in 0..<wordArr.count {
        if i == wordArr.count - 1 {
            newString += reverseLetters(wordArr[i])
        } else {
            newString += reverseLetters(wordArr[i]) + " "
        }
    }
    
    return newString
}

//reverseWords("Let's take LeetCode contest")









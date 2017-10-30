//: [Previous](@previous)

import Foundation

enum Bracket: Character {
    case Left = "("
    case Right = ")"
    case LeftCurly = "{"
    case RightCurly = "}"
    case LeftSquare = "["
    case RightSquare = "]"
    
    /// For a closing bracket, the corresponding opening bracket is returned.
    /// For an opening bracket, `nil` is returned.
    var matchingOpen: Bracket? {
        switch self {
        case .Right:        return .Left
        case .RightCurly:   return .LeftCurly
        case .RightSquare:  return .LeftSquare
        default:            return nil
        }
    }
}

func isBalanced(sequence: [Character]) -> Bool {
    var stack = [Bracket]()
    for char in sequence {
        if let bracket = Bracket(rawValue: char) {
            if let open = bracket.matchingOpen {
                // `bracket` is a closing bracket and `open` the corresponding opening bracket:
                guard let last = stack.last, last == open  else {
                    return false
                }
                stack.removeLast()
            } else {
                // `bracket` is an opening bracket:
                stack.append(bracket)
            }
        } else {
            fatalError("unknown bracket found")
        }
    }
    return stack.isEmpty
}

isBalanced(sequence: ["]", "{", "}","["])


//Write an algorithm that moves every element in an array of Ints one space to the left
//Sample input: [0,1,2,3,4,5]
//Sample output: [1,2,3,4,5,0]

func reorderArr(arr: [Int]) -> [Int] {
    var newArr = [Int]()
    for i in 1...arr.count {
        newArr.append(arr[i%arr.count])
    }
    return newArr
}

reorderArr(arr: [0,1,2,3,4,5])

//Write an algorithm that moves every element in an array of Ints (x) spaces to the left
//Sample input: [0,1,2,3,4,5], 3
//Sample output: [3,4,5,0,1,2]

func reorderArrN(arr: [Int], n: Int) -> [Int] {
    var firstHalf = [Int]()
    var secondHalf = [Int]()
    
    for i in 0..<arr.count {
        if i < n {
            firstHalf.append(arr[i])
        } else {
            secondHalf.append(arr[i])
        }
    }
    
    return secondHalf + firstHalf
}

reorderArrN(arr: [0,1,2,3,4,5], n: 3)

//: [Next](@next)

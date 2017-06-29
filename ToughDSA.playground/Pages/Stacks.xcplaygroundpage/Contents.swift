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

isBalanced(sequence: ["{", ")"])


//: [Next](@next)

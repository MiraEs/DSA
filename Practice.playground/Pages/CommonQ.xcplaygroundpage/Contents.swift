//: [Previous](@previous)

import Foundation

///1. FIBONACCI - find the first n in the fibonacci seq
/// recursive?

func fibonacci(_ n: Int) -> [Int] {
    var seq = [0, 1]
    var last = 0
    var current = 1
    var newNum = 0
    var count = 2
    
    while count < n {
        newNum = last + current
        seq.append(newNum)
        last = current
        current = newNum
        count += 1
    }
    
    return seq
}

func fibonacciB(_ n: Int) -> [Int] {
    var seq = [0, 1]
    for _ in 3...n {
        let first = seq[seq.count - 2]
        let second = seq.last!
        seq.append(first + second)
    }
    return seq
}

fibonacciB(8)
fibonacci(8)
//: [Next](@next)

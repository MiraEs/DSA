//: Playground - noun: a place where people can play

import UIKit

/// Arrays

/*
1. Find the sum of the diagonals of a square, two-dimensional array of Ints
 S:
 input:
 1 2 9
 8 2 3
 4 5 6
 
 1 1 1 1
 1 1 1 1
 1 1 1 1
 1 1 1 1
 1 1 1 1
 output: 24
 */
var arrOne = [[1,2,9],
              [8,2,3],
              [4,5,6]]

var arrOneA = [[1,2,9,1,1,1],
              [8,2,3,1,1,1],
              [4,5,6,1,1,1],
              [1,1,1,1,1,1],
              [1,1,1,1,1,1],
              [1,1,1,1,1,1]]

func sumOfDiag(_ arr: [[Int]]) -> Int {
    var sum = 0
    for i in 0..<arr.count {
        sum += arr[i][i]
        sum += arr[i][arr.count - 1 - i]
    }
    return sum
}

//sumOfDiag(arrOne)

/*
 2. Find all elements in an array that appear more than once
 Input                              Output
 [1, 4, -2, -9, 2, -2, 1, 10, 4]    [1, -2, 4]
 */

let arrTwo = [1, 4, -2, -9, 2, -2, 1, 10, 4]
func findRepeat(_ arr: [Int]) -> [Int] {
    var repeatsDict = [Int:Int]()
    var repeatsArr = [Int]()
    
    for num in arr {
        repeatsDict[num] = (repeatsDict[num] == 0) ? 1 : 0
    }
    
    for (key,value) in repeatsDict {
        if value == 1 {
            repeatsArr.append(key)
        }
    }
    
    return repeatsArr
}
//** ALT SOLUTION B
func findRepeatB(_ arr: [Int]) -> [Int] {
    var repeatDict = [Int:Int]()
    for num in arr {
        repeatDict[num] = repeatDict[num, default: 0] + 1
    }
    return Array(repeatDict.filter({$0.value > 1}).keys)
}

findRepeat(arrTwo)
findRepeatB(arrTwo)


/*
 3. Find the sum of the first five even numbers in an array of Ints.

 Input                                  Output
 [3,7,-3,2,9,4,8,10,3,9,4,9,8,6,-2]     28
 */
var arrThree = [3,7,-3,2,9,4,8,10,3,9,4,9,8,6,-2]

func findSum(_ arr: [Int]) -> Int {
    var sum = 0
    var count = 0
    for num in arr {
        if num % 2 == 0 && count < 5 {
            sum += num
            count += 1
        }
    }
    return sum
}

func findSumB(_ arr: [Int]) -> Int {
    return arr.filter{$0 % 2 == 0}.prefix(5).reduce(0, +)
}

findSumB(arrThree)
findSum(arrThree)

/*
 4. Given a square, two dimensional array of Ints, find the row or column that has the greatest sum. If more than one row or column are tied, return all of them.
 
 Input    Output
 1 2 9
 8 2 3
 4 5 6    Column 2: 18
 */
var arrfour = [[1,2,9],
              [8,2,3],
              [4,5,6]]

func findGreatsetSum(_ arr: [[Int]]) -> Int {
    var largestSum = 0
    
    for i in 0..<arrfour.count {
        var tempSum = 0
        var tempRow = 0
        var tempCol = 0

        for j in 0..<arrfour[i].count {
            tempRow += arrfour[i][j]
            tempCol += arrfour[j][i]
        }
        tempSum = tempRow > tempCol ? tempRow : tempCol
        largestSum = tempSum > largestSum ? tempSum : largestSum
        tempRow = 0
        tempCol = 0
        tempSum = 0
    }
    return largestSum
}

enum Location {
    case row(Int)
    case column(Int)
}

func findGreatestSumB(_ arr: [[Int]]) -> (Location, Int) {
    var max = (Location.row(0), sum: 0)
    
    for (index, row) in arr.enumerated() {
        let rowSum = row.reduce(0, +)
        if rowSum > max.sum {
            max = (.row(index), rowSum)
        }
    }
    
    for columnIndex in 0..<arr[0].count {
        var columnSum = 0
        for rowIndex in 0..<arr.count {
            columnSum += arr[rowIndex][columnIndex]
        }
        if columnSum > max.sum {
            max = (.column(columnIndex), columnSum)
        }
    }
    return max
}

findGreatsetSum(arrfour)
findGreatestSumB(arrfour)

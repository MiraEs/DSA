//: Playground - noun: a place where people can play

import UIKit

//https://leetcode.com/problems/search-insert-position/#/description


/*
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 Here are few examples.
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    // let midIndex = nums[nums.count/2]
    var index = Int()
    for i in 0..<nums.count {
        if target == nums[i] {
            index = i
        } else {
            if target > nums[i] {
                index = i+1
            }
        }
    }
    return index
}


//faster? Binary search
func twoSearchInsert(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = low + (high - low)/2
        if target < nums[mid] {
            high = mid - 1
        } else if target > nums[mid] {
            low = mid + 1
        } else {
            return mid
        }
    }
    return low
}


searchInsert([1,3,5,6], 4)
twoSearchInsert([1,3,5,6], 4)

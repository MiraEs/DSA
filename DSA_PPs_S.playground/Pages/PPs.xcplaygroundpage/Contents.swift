//: [Previous](@previous)

import Foundation

//https://leetcode.com/problems/two-sum/description/
//Brute force, O(n)^2
//nested for loops (initially check prior for array count)

//Hash-Table, O(n)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var mapSums: [Int:Int] = [:]
    var solution = [Int]()
    
    for i in 0..<nums.count {
        mapSums[nums[i]] = i
    }
    
    for i in 0..<nums.count {
        let pair = target - nums[i]
        if let value = mapSums[pair] {
            if value != i {
                solution = [i, value]
                return solution
            }
        }
    }
    return solution
}

    //older solution for body func in "Hash-Table twoSum"
//        for (key, value) in mapSums {
//            if value == pair && key != i {
//                solution = [i, key]
//            }
//        }

//twoSum([3,2,3], 6) //[0,2]
twoSum ([3,2,4], 6) //[1,2]

//https://leetcode.com/problems/add-two-numbers/description/
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    
    return nil
}

var head = ListNode.init(1)
head.next = ListNode.init(2)
head.next?.next = ListNode.init(3)

print(head.next!.next!.val)





//: [Next](@next)

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

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode {
    var newHead = ListNode.init(0)
    var current1 = l1
    var current2 = l2
    
    while current1 != nil || current2 != nil {
        
        let sum = current1!.val + current2!.val
        newHead = ListNode.init(sum)
        
        newHead.next = ListNode.init(0)
        newHead = newHead.next!
        current1 = current1?.next
        current2 = current2?.next
        
    }
    
    //for the last node
    
    //if links aren't equal lengths
    
    
    return newHead
}

var head1 = ListNode.init(2)
head1.next = ListNode.init(3)
head1.next?.next = ListNode.init(4)

var head2 = ListNode.init(1)
head2.next = ListNode.init(1)
head2.next?.next = ListNode.init(1)

//print(head.next!.next!.val)

let head3 = addTwoNumbers(head1, head2)
//print(head3.next!.val)

func printNodes(_ head: ListNode) {
    var current = head
    while current.next != nil {
        print(current.val)
        current = current.next!
    }
    print(current.val)
}

printNodes(head1)




//: [Next](@next)

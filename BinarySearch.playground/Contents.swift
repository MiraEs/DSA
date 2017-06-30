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

//617. Merge Two Binary Trees - https://leetcode.com/problems/merge-two-binary-trees/#/description
/*
 Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
 
 You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
 
 Example 1:
Input: 
	Tree 1                     Tree 2                  
          1                         2                             
         / \                       / \                            
        3   2                     1   3                        
       /                           \   \                      
      5                             4   7                  
Output: 
Merged tree:
	     3
	    / \
	   4   5
	  / \   \ 
	 5   4   7
 */

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

//test
func printNodes(_ t1: TreeNode?) {
    var current = t1
    
    while current?.val != nil {
        print((current?.val)!)
        current = current?.left
    }
}
//

var tree1 = TreeNode.init(1)
tree1.left = TreeNode.init(1)
tree1.left?.left = TreeNode.init(1)

var tree2 = TreeNode.init(10)
tree2.left = TreeNode.init(9)
tree2.left?.left = TreeNode.init(8)

//Solution
func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    var currentNode1 = t1
    var currentNode2 = t2
    let mergedTree: TreeNode? = TreeNode.init(currentNode1!.val + currentNode2!.val)
    //var current = mergedTree?.left
    
    while currentNode1?.val != nil && currentNode2?.val != nil {
        let value = currentNode1!.val + currentNode2!.val
        print("\(value) VALUE")
        
         mergedTree?.left = TreeNode.init(value)
        
        
        currentNode1 = currentNode1?.left
        currentNode2 = currentNode2?.left
    }
    printNodes(mergedTree)
    return mergedTree
}


mergeTrees(tree1, tree2)














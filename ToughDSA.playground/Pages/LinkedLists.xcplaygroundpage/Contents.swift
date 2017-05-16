//: Playground - noun: a place where people can play

import UIKit


//https://leetcode.com/problems/remove-duplicates-from-sorted-list/#/description
/*
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//not working
func myDeleteDuplicates(_ head: ListNode?) -> ListNode? {
    var currentNode = head
    var newLinkedList = head
    
    while currentNode?.val != nil {
        if currentNode?.val != newLinkedList?.val {
            newLinkedList?.next?.val = (currentNode?.val)!
            newLinkedList = newLinkedList?.next
        }
        currentNode = currentNode?.next
    }
    return currentNode
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard var currentNode = head else { return nil }
    
    while currentNode.next != nil {
        if currentNode.val == currentNode.next?.val {
            currentNode.next = currentNode.next?.next
        }
        else {
            currentNode = currentNode.next!
        }
    }
    dump(currentNode)
    return currentNode
}

//var head = ListNode(1)
//var myList = head
//myList.next?.val = 2
//myList.next?.next?.val = 3
//myList.next?.next?.next?.val = 4
//myList.next?.next?.next?.next?.val = 4

//head.next = ListNode(40)

var node1 = ListNode(1)
var node1b = ListNode(1)
node1.next = node1b
var node2 = ListNode(2)
node1b.next = node2
var node3 = ListNode(3)
var node3b = ListNode(3)
node2.next = node3
node3.next = node3b

myDeleteDuplicates(node1)

//
//  ViewController.swift
//  CheckIfTreeIsBinarySearchTree
//
//  Created by MUKUL on 19/01/19.
//  Copyright © 2019 CoderWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nodeObj = self.createBinaryTree()
        let statusString = self.checkIfTreeIsBst(nodeVal: nodeObj!)
        print("\(statusString)")
        
    }
    
    func createBinaryTree() ->Node! {
        //Left SubTree
        let nodeLeftLeft = Node()
        nodeLeftLeft.data = 14
        
        let rightNd = Node()
        rightNd.data = 18
        
        //LeftNode
        let nodeLeft = Node()
        nodeLeft.data = 15
        nodeLeft.leftNode = nodeLeftLeft
        nodeLeft.rightNode = rightNd
        
        //-----------------------------\\
        let nn = Node()
        nn.data  = 25
        
        //---------------------\\
        //Complete Binary Tree
        let nodeObj = Node()
        nodeObj.data = 20
        nodeObj.leftNode = nodeLeft
        nodeObj.rightNode = nn
        return nodeObj
    }
    
    func checkIfTreeIsBst(nodeVal:Node) -> String {
        let leftMaxVal = self.getLeftMax(node: nodeVal)
        print("leftMax is",leftMaxVal)
        let rightMin = self.getRightMin(node: nodeVal)
        print("right min is",rightMin)
        if nodeVal.data! >= leftMaxVal! && nodeVal.data! < rightMin! {
            return "The Tree is a Binary Search Tree! COOL"
        }
        else {
            return "The Tree is not a Binary Search Tree!"
        }
    }
    
    func getLeftMax(node:Node) ->Int! {
        if node.leftNode != nil {
            let mx =  node.leftNode!.data!  >= self.getLeftMax(node: node.leftNode!) ? node.leftNode?.data : node.data
            return mx
        }
        else {
            return node.data
        }
    }
    
    func getRightMin(node:Node) ->Int! {
        if node.rightNode != nil {
            let mx = node.rightNode!.data! <= self.getRightMin(node: node.rightNode!) ? node.rightNode?.data : node.data
            return mx
        }
        else {
            return node.data!
        }
    }
}


class Node {
    var data:Int?
    var leftNode:Node?
    var rightNode:Node?
}

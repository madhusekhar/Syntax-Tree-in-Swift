//: Abstract Syntax Tree - Mathematical Expression Evaluation

import UIKit

// Example:
// 5 + 25 * 6
5 + 25 * 6

// Represent the equation above in a tree
//       '+'
//     /     \
//   '*'      5
//   / \
//  25  6

// Node that represents a value or operator in Abstract Syntax Tree
class Node {
    var operation: String?  //"+", "-", "*", "/"
    var value: Float?
    var leftChild: Node?
    var rightChild: Node?
    
    init(operation: String?, value: Float?, leftChild: Node?, rightChild: Node?) {
        self.operation = operation
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

// 25 * 6 + 5

//      +
//     + 5
//   25 6

let sixNode = Node(operation: nil, value: 6, leftChild: nil, rightChild: nil)
let fiveNode = Node(operation: nil, value: 5, leftChild: nil, rightChild: nil)
let twentyFiveNode = Node(operation: nil, value: 25, leftChild: nil, rightChild: nil)

let mult25_6Node = Node(operation: "*", value: nil, leftChild: twentyFiveNode, rightChild: sixNode)

let rootPlusNode = Node(operation: "+", value: nil, leftChild: mult25_6Node, rightChild: fiveNode)

// Implement this algorithm, the above tree evaluates to 155
func evaluate(node: Node) -> Float {
    if node.value != nil {
        return node.value!
    }
    
    if node.operation == "+" {
        //apply recursion
        return evaluate(node: node.leftChild!) + evaluate(node: node.rightChild!)
    } else if node.operation == "*" {
        return evaluate(node: node.leftChild!) * evaluate(node: node.rightChild!)
    } else if node.operation == "-" {
        return evaluate(node: node.leftChild!) - evaluate(node: node.rightChild!)
    } else if node.operation == "/" {
        //if node right child is zero, you need to throw an error
        return evaluate(node: node.leftChild!) / evaluate(node: node.rightChild!)
    }
    
    return 0
}

evaluate(node: rootPlusNode)













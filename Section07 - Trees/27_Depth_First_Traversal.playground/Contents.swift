import UIKit

class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []

    init(_ value: T) {
        self.value = value
    }

    func add(_ child: TreeNode) {
        self.children.append(child)
    }
}

extension TreeNode {
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        children.forEach {  $0.forEachDepthFirst(visit) }
    }
}

let beverages = TreeNode<String>("Beverages")

let hot = TreeNode<String>("Hot")
let cold = TreeNode<String>("Cold")

let tea = TreeNode("Tea")
let coffee = TreeNode("Coffe")

hot.add(tea)
hot.add(coffee)

let soda = TreeNode("Soda")
let milk = TreeNode("Milk")

cold.add(soda)
cold.add(milk)

beverages.add(hot)
beverages.add(cold)

beverages.forEachDepthFirst { print($0.value) }

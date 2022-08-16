import UIKit

/// LIFO
/// Last in first out

struct Stack<Element> {
    private var storage: [Element] = []

    init() { }

    mutating func push(_ element: Element) {
        storage.append(element)
    }

    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "-----top-----\n"
        let bottomDivider = "\n-------------"

        let stackElements = storage.map { "\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()

stack.push(3)
stack.push(4)
stack.push(5)
stack.push(6)

print(stack)

stack.pop()

print(stack)

import UIKit

class Node<Value> {
    var value: Value
    var next: Node?

    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?

    var isEmpty: Bool {
        return head == nil
    }

    /// inserir valor no inicio
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    /// verificar a posição do elemento e retorna
    func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head

        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }

        return currentNode
    }

    /// inserir valor em um posição especifica
    mutating func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }

    /// inserir valor no final
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        let node = Node(value: value)
        tail!.next = node
        tail = node
    }

    /// remover o valor inicial da lista encadeada
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }

    mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }

        guard head.next != nil else {
            return pop()
        }

        var prev = head
        var current = head

        while let next = current.next {
            prev = current
            current = next
        }

        prev.next = nil
        tail = prev

        return current.value
    }

    mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }

        return node.next?.value
    }

    init() { }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

var list = LinkedList<Int>()
list.append(10)
list.append(3)
list.append(12)
list.append(100)

print(list)

let index = 1
let node = list.node(at: index - 1)!
let removedValue = list.remove(after: node)

print(list)



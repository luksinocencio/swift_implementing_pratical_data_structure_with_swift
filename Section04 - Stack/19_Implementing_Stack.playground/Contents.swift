import UIKit

/// LIFO
/// Last in first out

struct Stack<Element> {
    private var storage: [Element] = []

    init() { }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "-------top--------"
        let bottomDivider = "\n-------------"

        let stackElements = storage.map { "\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

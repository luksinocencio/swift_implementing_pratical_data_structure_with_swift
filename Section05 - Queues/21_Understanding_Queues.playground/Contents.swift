import UIKit

/// FIFO
/// First in first out

struct Queues<T> {
    var array: [T] = []

    var isEmpty: Bool {
        return array.isEmpty
    }

    var peek:T? {
        return array.first
    }

    init() { }
}

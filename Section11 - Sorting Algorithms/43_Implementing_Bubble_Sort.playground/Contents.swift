import UIKit

var numbers = [2, 6, 7, 19, 11, 45, 99, 23, 56, 78, 9]

print("Array before sorted")
print(numbers)

for i in 0..<numbers.count {
    for j in 0..<numbers.count {
        if numbers[i] < numbers[j] {
//            let temp = numbers[i]
//            numbers[i] = numbers[j]
//            numbers[j] = temp
            numbers.swapAt(i, j)
        }
    }
}

print(numbers)

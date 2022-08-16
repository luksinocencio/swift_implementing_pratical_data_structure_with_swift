import UIKit

let numbers = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]

var lowerBound = 0
var upperBound = numbers.count - 1
var middle = 0
var found = false
var valueToSearch = 17

while(lowerBound <= upperBound) {
    middle = (lowerBound + upperBound)

    if (numbers[middle] == valueToSearch) {
        found = true
        break
    } else if (numbers[middle] < valueToSearch) {
        lowerBound = middle + 1
    } else {
        upperBound = middle - 1
    }
}

print(found)




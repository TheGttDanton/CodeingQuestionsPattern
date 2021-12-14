//Given an array of positive numbers and a positive number ‘S,’ find the length of the smallest contiguous subarray whose sum is greater than or equal to ‘S’. Return 0 if no such subarray exists.

func smallestSubarrayWithSum(array: [Int], s: Int) -> Int? {
    var currentLength = 0
    var smallestLength: Int? = nil
    var currentSum = 0
    
    for (index, value) in array.enumerated() {
        currentSum += value
        currentLength += 1

        while(currentSum >= s) {
            if currentLength < (smallestLength ?? Int.max) {
                smallestLength = currentLength
            }
            currentSum -= array[index - (currentLength - 1)]
            currentLength -= 1
            
        }
    }
    return smallestLength
}

let array = [2, 1, 5, 2, 3, 8]
let s=97

print(smallestSubarrayWithSum(array: array, s: s))

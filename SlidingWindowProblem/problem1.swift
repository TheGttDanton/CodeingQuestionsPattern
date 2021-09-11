//Given an array of positive numbers and a positive number ‘k,’ find the maximum sum of any contiguous subarray of size ‘k’.
//
//Input: [2, 1, 5, 1, 3, 2], k=3
//Output: 9


func findMaximumSubarraySum(input: [Int], k: Int) -> Int {
    var highestSum = 0
    var subArraySize = 0
    var currentSum = 0
    
    for (index, number) in input.enumerated() {
        if subArraySize < k {
            currentSum += number
            subArraySize += 1
            highestSum = currentSum
        } else {
            currentSum += number
            currentSum -= input[index - k]
            if highestSum < currentSum {
                highestSum = currentSum
            }
        }
    }
    return highestSum
}

let input = [2, 1, 5, 1, 3, 2]
let k = 3
let highestSum = findMaximumSubarraySum(input: input, k: k)
print(highestSum)

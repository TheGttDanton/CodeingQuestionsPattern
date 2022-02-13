:q//Given an array containing 0s and 1s, if you are allowed to replace no more than ‘k’ 0s with 1s, find the length of the longest contiguous subarray having all 1s.

let array = [0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1]
let k = 3


func longestContiguousSubArray(_ array: [Int], _ k: Int) -> Int {
    var maxLength = 0
    var start = 0
    var k = k
    for (index, value) in array.enumerated() {
        if value == 0 {
            
            if k <= 0 {
                while array[start] == 1 {
                    start += 1
                }
                start += 1
            } else {
                k = k - 1
            }
            
        }
        let currentLength = (index - start + 1)
        if maxLength < currentLength {
            maxLength = currentLength
        }
    }
    return maxLength
}


let length = longestContiguousSubArray(array, k)
print(length)

//Given a string, find the length of the longest substring in it with no more than K distinct characters.

func longestDistinctSubstring(string: String, k: Int) -> Int {
    var currentLength = 0
    var longestLength = 0
    var charCountMap: [Character: Int] = [:]
    
    for (index, char) in string.enumerated() {
        var currentCharCount = charCountMap[char] ?? 0
        currentCharCount += 1
        charCountMap[char] = currentCharCount
        currentLength += 1
        
        while (charCountMap.count > k) {
            let startCharIndex = string.index(string.startIndex, offsetBy: index - (currentLength - 1))
            let startChar = string[startCharIndex]
            
            let startCharCount = (charCountMap[startChar] ?? 1) - 1
            if startCharCount == 0 {
                charCountMap[startChar] = nil
            } else {
                charCountMap[startChar] = startCharCount
            }
            
            currentLength -= 1
        }
        
        if currentLength > longestLength {
            longestLength = currentLength
        }
    }
    return longestLength
}

let string="cbbebi"
let k=3

print(longestDistinctSubstring(string: string, k: k))


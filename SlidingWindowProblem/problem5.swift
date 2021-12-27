//Given a string, find the length of the longest substring, which has all distinct characters.

func distinctCharSubstring(string: String) -> Int {
    var maxLength = 0
    var currentLength = 0
    var collector: [Character: Int] = [:]
    var start = 0
    
    for char in string {
        currentLength += 1
        collector[char] = (collector[char] ?? 0) + 1
        
        while (collector[char] ?? 0) > 1 {
            let statChar = string[string.index(string.startIndex, offsetBy: start)]
            let statCharCount = collector[statChar] ?? 0
            if statCharCount == 0 {
                collector[statChar] = nil
            } else {
                collector[statChar] = statCharCount - 1
            }
            
            start += 1
            currentLength -= 1
        }
        
        if currentLength > maxLength {
            maxLength = currentLength
        }
        
    }
    
    
    return maxLength
}
let string = "abccde"
let maxSubstringLength = distinctCharSubstring(string: string)
print(maxSubstringLength)

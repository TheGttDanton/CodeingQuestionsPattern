//Given a string and a pattern, find out if the string contains any permutation of the pattern.

func isPatternExists(string: String, pattern: String) -> Bool {
    // Find count of letters in pattern. For pattern to exists number of character in pattern and substring should be same
    var characterCount: [Character: Int] = [:]
    var patternFound = false
    // find the character count
    for char in pattern {
        characterCount[char] = (characterCount[char] ?? 0) + 1
    }
    
    // In this dictionary, we will increment and decrement the character count. If this dictionary is empty at any point in time that's mean we found the pattern.
    var characterCountCopy = characterCount
    
    for char in string {
        let countOfCurrentChar = characterCountCopy[char]
        if let countOfCurrentChar = countOfCurrentChar {
            if countOfCurrentChar == 1 {
                characterCountCopy[char] = nil
            } else {
                characterCountCopy[char] = countOfCurrentChar - 1
            }
            
            // Check if the characterCountCopy is empty
            if characterCountCopy.isEmpty {
                // pattern exists
                patternFound = true
                break
            }
            
        } else {
            characterCountCopy = characterCount
        }
    }
    
    return patternFound
}

let givenString = "bcdxabcdy"
let pattern = "bcdyabcdx"

let isPattern = isPatternExists(string: givenString, pattern: pattern)
if isPattern {
    print("Pattern Exists")
} else {
    print("Pattern does not exists")
}

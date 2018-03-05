Palindrome checking.
========

[![Swift Version](https://img.shields.io/badge/Swift-4.0-orange.svg)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://www.apple.com/ru/ios)

String iterator for Swift.

```swift
func isPalindrom(_ input: String) -> Bool {
    guard !input.isEmpty else { return true }
    
    let left = input.iterator(input.startIndex)
    let right = input.iterator(input.endIndex)
    --right
    
    while left < right {
        while left < right && !left.character.isLetterOrNumber {
            ++left
        }
        
        while left < right && !right.character.isLetterOrNumber {
            --right
        }
        
        if left >= right { break }
        guard left.character.isCaseInsensitiveEqual(right.character) else {
            return false
        }
        
        ++left
        --right
    }
    
    return true
}
```

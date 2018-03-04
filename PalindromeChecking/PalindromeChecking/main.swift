//
//  main.swift
//  PalindromeChecking
//
//  Created by Vyacheslav Khorkov on 18/02/2018.
//  Copyright © 2018 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

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

print(isPalindrom("Madam, I’m Adam "))  // true
print(isPalindrom("Madam"))             // true
print(isPalindrom("aa,..-"))            // true
print(isPalindrom("a,.A+-"))            // true
print(isPalindrom("a,.b+-"))            // false

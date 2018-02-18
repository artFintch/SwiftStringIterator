//
//  StringIterator.swift
//  PalindromeChecking
//
//  Created by Vyacheslav Khorkov on 18/02/2018.
//  Copyright © 2018 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

class StringIterator {
    let string: String
    private(set) var index: String.Index
    
    var character: Character {
        return string[index]
    }
    
    @discardableResult static prefix func ++(_ iterator: StringIterator) -> Bool {
        return iterator.moveAfter()
    }
    
    @discardableResult static prefix func --(_ iterator: StringIterator) -> Bool {
        return iterator.moveBefore()
    }
    
    init(_ string: String, index: String.Index) {
        self.string = string
        self.index = index
    }
    
    private func moveBefore() -> Bool {
        guard index != string.startIndex else { return false }
        index = string.index(before: index)
        return true
    }
    
    private func moveAfter() -> Bool {
        guard index != string.endIndex else { return false }
        let nextIndex = string.index(after: index)
        if nextIndex != string.endIndex {
            index = nextIndex
            return true
        }
        return false
    }
}

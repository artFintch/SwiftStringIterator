//
//  StringIterator+Compare.swift
//  PalindromeChecking
//
//  Created by Vyacheslav Khorkov on 18/02/2018.
//  Copyright © 2018 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

func <(_ leftIterator: StringIterator, _ rightIterator: StringIterator) -> Bool {
    return leftIterator.index < rightIterator.index
}

func >=(_ leftIterator: StringIterator, _ rightIterator: StringIterator) -> Bool {
    return leftIterator.index >= rightIterator.index
}

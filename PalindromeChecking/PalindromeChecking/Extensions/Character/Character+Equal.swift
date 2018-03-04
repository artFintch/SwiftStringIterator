//
//  Character+Equal.swift
//  PalindromeChecking
//
//  Created by Vyacheslav Khorkov on 18/02/2018.
//  Copyright © 2018 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

extension Character {
    func isCaseInsensitiveEqual(_ another: Character) -> Bool {
        let selfString = String(self)
        let anotherString = String(another)
        return (selfString.caseInsensitiveCompare(anotherString) == .orderedSame)
    }
}

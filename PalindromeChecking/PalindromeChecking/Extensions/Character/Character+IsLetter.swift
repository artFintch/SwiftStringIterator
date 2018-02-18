//
//  Character+IsLetter.swift
//  PalindromeChecking
//
//  Created by Vyacheslav Khorkov on 18/02/2018.
//  Copyright © 2018 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

extension Character {
    var isLetter: Bool {
        return "a"..."z" ~= self || "A"..."Z" ~= self
    }
}

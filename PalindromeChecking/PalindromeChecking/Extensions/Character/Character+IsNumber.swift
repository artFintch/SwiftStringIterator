//
//  Character+IsNumber.swift
//  PalindromeChecking
//
//  Created by Vyacheslav Khorkov on 18/02/2018.
//  Copyright © 2018 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

extension Character {
    var isNumber: Bool {
        return "0"..."9" ~= self
    }
}

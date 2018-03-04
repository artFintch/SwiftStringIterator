//
//  String+Iterator.swift
//  PalindromeChecking
//
//  Created by Vyacheslav Khorkov on 04/03/2018.
//  Copyright © 2018 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

extension String {
    func iterator(_ index: String.Index) -> StringIterator {
        return StringIterator(self, index: index)
    }
}

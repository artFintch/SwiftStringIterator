//
//  PalindromCheckingTests.swift
//  PalindromCheckingTests
//
//  Created by Vyacheslav Khorkov on 06/03/2018.
//  Copyright © 2018 Vyacheslav Khorkov. All rights reserved.
//

import XCTest

class PalindromCheckingTests: XCTestCase {
    let text: String = {
        let textSet = Array(" ,.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        var text = ""
        let count = 10_000_000
        for _ in 0..<count {
            let randomCharacter = arc4random_uniform(UInt32(textSet.count))
            text.append(textSet[Int(randomCharacter)])
        }
        return text
    }()
    
    func testPerformanceExample0() {
        // The test just prepares text initialization,
        // exclude this time from real tests.
        measure {
            _ = text
        }
    }
    
    func testPerformanceExample1() {
        measure {
            _ = isPalindrom(text)
        }
    }
    
    func testPerformanceExample2() {
        measure {
            _ = isPalindrom2(text)
        }
    }
    
    func testPerformanceExample3() {
        measure {
            _ = isPalindrom3(text)
        }
    }
    
    func testCorrectness() {
        let functions = [isPalindrom, isPalindrom2, isPalindrom3]
        for function in functions {
            print(function)
            XCTAssertTrue(function(""))
            XCTAssertTrue(function("  "))
            XCTAssertTrue(function("a"))
            XCTAssertTrue(function("aA"))
            XCTAssertTrue(function("aAA"))
            XCTAssertFalse(function("aAAB"))
            XCTAssertTrue(function("Madam, I’m Adam "))
            XCTAssertTrue(function("Madam"))
            XCTAssertTrue(function("aa,..-"))
            XCTAssertTrue(function("a,.A+-"))
            XCTAssertFalse(function("a,.b+-"))
        }
    }
    
    func isPalindrom2(_ str: String) -> Bool {
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        var range = str.startIndex..<str.endIndex
        
        while range.lowerBound < range.upperBound {
            var left: Substring!
            var right: Substring!
            
            while let r = str.rangeOfCharacter(from: set, range: range) {
                range = r.upperBound..<range.upperBound
                left = str[r]
                break
            }
            while let r = str.rangeOfCharacter(from: set, options: .backwards, range: range) {
                range = range.lowerBound..<r.lowerBound
                right = str[r]
                break
            }
            
            guard left != nil && right != nil else { break }
            // lowercased() -> Creates String from Substring -> O(n) memory
            guard left == right || left.lowercased() == right.lowercased() else { return false }
        }
        return true
    }
    
    func isPalindrom3(_ input: String) -> Bool {
        let palindromCharacters = CharacterSet.letters.union(CharacterSet.decimalDigits)
        var range = input.startIndex..<input.endIndex
        
        while range.lowerBound < range.upperBound {
            var left: Substring?
            if let leftRange = input.rangeOfCharacter(from: palindromCharacters, range: range) {
                range = leftRange.upperBound..<range.upperBound
                left = input[leftRange]
            }
            
            var right: Substring?
            if let rightRange = input.rangeOfCharacter(from: palindromCharacters,
                                                       options: .backwards,
                                                       range: range) {
                range = range.lowerBound..<rightRange.lowerBound
                right = input[rightRange]
            }
            
            guard left != nil && right != nil else { break }
            // lowercased() -> Creates String from Substring -> O(n) memory
            guard left?.lowercased() == right?.lowercased() else { return false }
        }
        
        return true
    }
}

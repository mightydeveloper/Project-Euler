//
//  ProjectEulerLibrary.swift
//  ProjectEuler
//
//  Created by Young Seok Kim on 6/14/15.
//  Copyright (c) 2015 TonyKim. All rights reserved.
//

import Foundation

// --------------------------------------------------------------
// MARK: - Type extensions
// --------------------------------------------------------------


//  String Type extension to support subscript operation
//  Example Usage :
//  "abcd"[2]
//  returns 'c'
//  "asdf"[1...2]
//  returns "sd"
extension String {
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
}

// --------------------------------------------------------------
// MARK: - Utility functions
// --------------------------------------------------------------

//  Checks if the given string is palindrome
func isPalindrome(str : String) -> Bool {
    let length = count(str)
    for i in 0..<length/2 {
        if str[i] != str[(length-i-1)] {
            return false
        }
    }
    return true;
}

//  Checks if the given integer is palindrome.
//  multiples of 11 - optimization included
func isPalindrome(num : Int) -> Bool {
    if (0<num && num<10) {return true}
    if num%11 != 0 {
        return false
    }
    return isPalindrome(String(num))
}

//  Find maximum element in the given Array.
//  The array elements must be comparable
// Old code
/*
func findMax<T:Comparable>(arr:Array<T>) -> T{
    var temp = arr[0]
    for element in arr {
        if temp<element {
            temp = element
        }
    }
    return temp
}
*/

// Using library function "reduce" in Array datastructure in Swift,
func findMax<T:Comparable>(arr:Array<T>) -> T?{
    if arr.isEmpty {return nil}
    return arr.reduce(arr[0]) {if $0 < $1 {return $1} else {return $0}}
}


// Find minimum element in the given Array
func findMin<T:Comparable>(arr:Array<T>) -> T?{
    if arr.isEmpty {return nil}
    return arr.reduce(arr[0]) {if $0 < $1 {return $0} else {return $1}}
}



//  Evaluates the program that returns an integer. 
//  It measures the running time of the given program.
func evaluateProblem(problemNumber: Int, problemBlock: () -> Int) {
    println("Evaluating problem \(problemNumber)...");
    
    let start = NSDate(); // Start time
    let myGuess = problemBlock();
    let end = NSDate();   // End time
    
    println("My answer is \(myGuess)")
    let timeInterval: Double = end.timeIntervalSinceDate(start); // <<<<< Difference in seconds (double)
    
    println("Time to evaluate problem \(problemNumber): \(timeInterval) seconds");
}




// --------------------------------------------------------------
// MARK: - Number theory functions
// --------------------------------------------------------------


// Factors the given integer and outputs its array of prime numbers
func factorInteger(number:Int) -> [Int] {
    func generateArray(number:Int, soFar : [Int]) -> (Int,[Int]) {
        for i in 2..<number {
            if  number%i == 0 {
                return (number/i, soFar+[i])
            }
        }
        return (1, soFar+[number])
    }
    var temp = number
    var temparr : [Int] = []
    while temp != 1 {
        (temp, temparr) = generateArray(temp, temparr)
    }
    return temparr
}



// Greatest Common Divisor
func GCD(num1:Int, num2:Int) -> Int {
    if (num2 == 0) {return num1}
    return GCD(num2, num1%num2)
}

// Least Common Multiple
func LCM(num1:Int, num2:Int) -> Int {
    if (num1 == 0 && num2 == 0 ) {
        return 0
    }
    return num2*(num1/GCD(num1,num2)) // num1*num2 might overflow.
}


// GCD of array of numbers
func GCD(intarr:[Int]) -> Int {
    if count(intarr) == 1 {
        return intarr[0]
    }
    var temp = intarr[0]
    for num in intarr {
        temp = GCD(temp, num)
    }
    return temp
}

// LCM of array of numbers
func LCM(intarr:[Int]) -> Int {
    if count(intarr) == 1 {
        return intarr[0]
    }
    var temp = intarr[0]
    for num in intarr {
        temp = LCM(temp, num)
    }
    return temp
}







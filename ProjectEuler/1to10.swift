//
//  1to10.swift
//  ProjectEuler
//
//  Created by Young Seok Kim on 7/15/15.
//  Copyright (c) 2015 TonyKim. All rights reserved.
//

import Foundation

func problem1() {
    evaluateProblem(1) {
        var cnt = 0
        for i in 1..<1000 {
            if i%3==0 {
                cnt+=i
            } else if i%5==0 {
                cnt+=i
            }
        }
        return cnt
    }
}

func problem2() {
    evaluateProblem(2) {
        var prev = 1
        var term = 1
        var cnt = 0
        while (term<4000000) {
            (prev, term) = (term, term + prev)
            if term%2 == 0 {
                cnt += term
            }
        }
        return cnt
    }
}

func problem3() {
    evaluateProblem(3) {
        return findMax(factorInteger(600851475143))!
    }
}


func problem4() {
    evaluateProblem(4) {
        var temp : [Int] = []
        for i in 100...999 {
            for j in 100...999 {
                var mult = i*j
                if (isPalindrome(mult)) {
                    temp.append(mult)
                }
            }
        }
        return findMax(temp)!
    }
}


func problem5() {
    evaluateProblem(5) {
        return LCM([Int](1...20))
    }
}


func problem6() {
    evaluateProblem(6) {
        var SqOfSum = 0
        var SumOfSq = 0
        for i in 1...100 {
            SqOfSum += i
            SumOfSq += i*i
        }
        SqOfSum *= SqOfSum
        return SqOfSum - SumOfSq
    }
}


func problem7() {
    evaluateProblem(7) {
        var primes = sieveOfEratosthenes(limit: 1000000)
        return primes[10000] // 10001st prime.
    }
}


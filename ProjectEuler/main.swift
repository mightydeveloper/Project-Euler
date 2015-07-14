//
//  main.swift
//  ProjectEuler
//
//  Created by Young Seok Kim on 6/14/15.
//  Copyright (c) 2015 TonyKim. All rights reserved.
//

import Foundation

/* -------------------------------------------------*/


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
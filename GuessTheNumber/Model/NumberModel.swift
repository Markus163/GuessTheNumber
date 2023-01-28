//
//  ViewModel.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 28.01.2023.
//

import Foundation

class NumberModel {
    
    var minValue = 0
    var maxValue = 100
    lazy var valuesRange = minValue...maxValue
    lazy var middleValue = round(Double((minValue + maxValue) / 2))
    
     func moreNumber() -> Int {
        minValue = Int(middleValue)
        middleValue = round(Double((minValue + maxValue) / 2))
        if minValue == Int(middleValue) {
            middleValue += 1
        }
        return Int(middleValue)
    }
    
     func lessNumber() -> Int {
        maxValue = Int(middleValue)
        middleValue = round(Double((minValue + maxValue) / 2))
        if maxValue == Int(middleValue) {
            middleValue -= 1
        }
        return Int(middleValue)
    }
}

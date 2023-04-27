//
//  CalculatorResultModel.swift
//  YourssuCalculator
//
//  Created by 홍준혁 on 2023/04/27.
//

import Foundation

@frozen
enum CalculatorResult {
    case success(firstNum: Int, secondNum: Int, type: CalculateTpye, result: Int)
    case didSingleTextFieldFull
    case numEmptyFail
    case invalidNumFail
}

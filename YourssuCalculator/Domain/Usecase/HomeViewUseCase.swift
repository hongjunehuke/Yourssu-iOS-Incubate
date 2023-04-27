//
//  HomeViewUseCase.swift
//  YourssuCalculator
//
//  Created by 홍준혁 on 2023/04/26.
//

import Foundation

protocol HomeViewUseCase {
    func checkSuccess(
        isFirstTextFieldFull: Bool,
        isSecondTextFieldFull: Bool,
        firstNum: Int,
        secondNum: Int,
        calculateType: CalculateTpye
    ) -> CalculatorResult
    
    func checkNumEmptyFail(
        _ isFirstTextFieldFull: Bool,
        _ isSecondTextFieldFull: Bool
    ) -> Bool
    
    func checkisVaildFail(
        _ isFirstTextFieldFull: Bool,
        _ isSecondTextFieldFull: Bool,
        _ firstNum: Int,
        _ calculateType: CalculateTpye
    ) -> Bool
}

final class DefaultHomeViewUseCase: HomeViewUseCase {
    func checkSuccess(
        isFirstTextFieldFull: Bool,
        isSecondTextFieldFull: Bool,
        firstNum: Int,
        secondNum: Int,
        calculateType: CalculateTpye
    ) -> CalculatorResult {
        if checkNumEmptyFail(isFirstTextFieldFull,isSecondTextFieldFull) {
            return .numEmptyFail
        }
        if checkisVaildFail(isFirstTextFieldFull, isSecondTextFieldFull, firstNum, calculateType) {
            return .invalidNumFail
        }
        switch calculateType {
        case .plus: return .success(firstNum: firstNum, secondNum: secondNum, type: .plus, result: firstNum + secondNum)
        case .minus: return .success(firstNum: firstNum, secondNum: secondNum, type: .minus, result: firstNum - secondNum)
        case .mulitplus: return .success(firstNum: firstNum, secondNum: secondNum, type: .mulitplus, result: firstNum * secondNum)
        case .divis: return .success(firstNum: firstNum, secondNum: secondNum, type: .divis, result: firstNum / secondNum)
        }
        
    }
    
    func checkNumEmptyFail(
        _ isFirstTextFieldFull: Bool,
        _ isSecondTextFieldFull: Bool) -> Bool {
            if isFirstTextFieldFull == false ||
                isSecondTextFieldFull == false {
                return true
            } else {
                return false
            }
        }
    
    func checkisVaildFail(
        _ isFirstTextFieldFull: Bool,
        _ isSecondTextFieldFull: Bool,
        _ firstNum: Int,
        _ calculateType: CalculateTpye) -> Bool {
            if calculateType == .divis &&
                isFirstTextFieldFull == true &&
                isSecondTextFieldFull == true &&
                firstNum == 0 {
                return true
            } else {
                return false
            }
        }
}

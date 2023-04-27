//
//  HomeViewModel.swift
//  YourssuCalculator
//
//  Created by 홍준혁 on 2023/04/26.
//

import Foundation

protocol HomeViewModelInput {
    func firstTextFieldStartTyping(num: Int)
    func secondTextFieldStartTyping(num: Int)
    func plusButtonDidTap()
    func minusButtonDidTap()
    func multiplusButtonDidTap()
    func divisButtonDidTap()
}

protocol HomeViewModelOutput {
    var calculatorStatus: ((String) -> Void)? { get set }
}

protocol HomeViewModelInputOutput: HomeViewModelInput, HomeViewModelOutput {}

final class HomeViewModel: HomeViewModelInputOutput {
    
    private var isFirstTextFieldFull: Bool = false
    private var firstTextFieldNum: Int = 0
    private var secondTextFieldNum: Int = 0
    private var isSecondTextFieldFull: Bool = false
    private var homeViewUseCase: HomeViewUseCase
    
    // MARK: - Output
    
    var calculatorStatus: ((String) -> Void)?
    var status: CalculatorResult? {
        didSet {
            if let calculatorStatus = calculatorStatus,
               let status = status {
                switch status {
                case .success(let firstNum, let secondNum, let type, let result):
                    calculatorStatus(makeSuccessString(firstNum, secondNum, type, result))
                case .didSingleTextFieldFull:
                    calculatorStatus("버튼을 눌러주세요.")
                case .numEmptyFail:
                    calculatorStatus("숫자를 모두 입력해주세요.")
                case .invalidNumFail:
                    calculatorStatus("0으로 나눌 수 없습니다.")
                }
            }
        }
    }
    
    init(useCase: HomeViewUseCase) {
        self.homeViewUseCase = useCase
    }
    
    private func makeSuccessString(_ firstNum: Int, _ secondNum: Int, _ type: CalculateTpye, _ result: Int) -> String {
        let firstNum = String(firstNum)
        let secondNum = String(secondNum)
        let resultNum = String(result)
        switch type {
        case .plus: return firstNum + " + " + secondNum + " = " + resultNum
        case .minus: return firstNum + " - " + secondNum + " = " + resultNum
        case .mulitplus: return firstNum + " * " + secondNum + " = " + resultNum
        case .divis: return firstNum + " / " + secondNum + " = " + resultNum
        }
    }
}

extension HomeViewModel {
    
    // MARK: - Input
    
    func firstTextFieldStartTyping(num: Int) {
        isFirstTextFieldFull = true
        firstTextFieldNum = num
        status = .didSingleTextFieldFull
    }
    
    func secondTextFieldStartTyping(num: Int) {
        isSecondTextFieldFull = true
        secondTextFieldNum = num
        status = .didSingleTextFieldFull
    }
    
    func plusButtonDidTap() {
        status = homeViewUseCase.checkSuccess(
            isFirstTextFieldFull: isFirstTextFieldFull,
            isSecondTextFieldFull: isSecondTextFieldFull,
            firstNum: firstTextFieldNum,
            secondNum: secondTextFieldNum,
            calculateType: .plus)
    }
    
    func minusButtonDidTap() {
        status = homeViewUseCase.checkSuccess(
            isFirstTextFieldFull: isFirstTextFieldFull,
            isSecondTextFieldFull: isSecondTextFieldFull,
            firstNum: firstTextFieldNum,
            secondNum: secondTextFieldNum,
            calculateType: .minus)
    }
    
    func multiplusButtonDidTap() {
        status = homeViewUseCase.checkSuccess(
            isFirstTextFieldFull: isFirstTextFieldFull,
            isSecondTextFieldFull: isSecondTextFieldFull,
            firstNum: firstTextFieldNum,
            secondNum: secondTextFieldNum,
            calculateType: .mulitplus)
    }
    
    func divisButtonDidTap() {
        status = homeViewUseCase.checkSuccess(
            isFirstTextFieldFull: isFirstTextFieldFull,
            isSecondTextFieldFull: isSecondTextFieldFull,
            firstNum: firstTextFieldNum,
            secondNum: secondTextFieldNum,
            calculateType: .divis)
    }
}

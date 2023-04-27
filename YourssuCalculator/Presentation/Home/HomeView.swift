//
//  HomeView.swift
//  YourssuCalculator
//
//  Created by 홍준혁 on 2023/04/26.
//

import UIKit

import SnapKit

final class HomeView: BaseUIView {
    
    // MARK: - property
    
    lazy var firstNumTextField : UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(
            string: "첫번째 숫자를 입력해주세요.",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.596, green: 0.596, blue: 0.596, alpha: 1),
                         .font : UIFont.systemFont(ofSize: 14, weight: .regular)]
        )
        textfield.layer.borderColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1).cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 20
        textfield.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        textfield.setLeftPaddingPoints(17)
        return textfield
    }()
    
    lazy var secondNumTextField : UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(
            string: "두번째 숫자를 입력해주세요.",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.596, green: 0.596, blue: 0.596, alpha: 1),
                         .font : UIFont.systemFont(ofSize: 14, weight: .regular)]
        )
        textfield.layer.borderColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1).cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 20
        textfield.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        textfield.setLeftPaddingPoints(17)
        return textfield
    }()
    
    lazy var textLabel : UILabel = {
        let label = UILabel()
        label.text = "값을 먼저 입력해주세요."
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        return label
    }()
    
    lazy var plusButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.16, green: 0.63, blue: 0.73, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.setTitle("더하기", for: .normal)
        return button
    }()
    
    lazy var minusButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.16, green: 0.63, blue: 0.73, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.setTitle("빼기", for: .normal)
        return button
    }()
    
    lazy var multiplusButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.16, green: 0.63, blue: 0.73, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.setTitle("곱하기", for: .normal)
        return button
    }()
    
    lazy var divisButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.16, green: 0.63, blue: 0.73, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.setTitle("나누기", for: .normal)
        return button
    }()
    
    override func render() {
        self.addSubviews(
            firstNumTextField,
            secondNumTextField,
            textLabel,
            plusButton,
            minusButton,
            multiplusButton,
            divisButton
        )
        
        firstNumTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(157)
            $0.leading.equalToSuperview().offset(47)
            $0.trailing.equalToSuperview().inset(46)
            $0.height.equalTo(35)
        }
        
        secondNumTextField.snp.makeConstraints {
            $0.top.equalTo(firstNumTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(47)
            $0.trailing.equalToSuperview().inset(46)
            $0.height.equalTo(35)
        }
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(secondNumTextField.snp.bottom).offset(33)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        plusButton.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(46)
            $0.trailing.equalToSuperview().inset(47)
            $0.height.equalTo(39)
        }
        
        minusButton.snp.makeConstraints {
            $0.top.equalTo(plusButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(46)
            $0.trailing.equalToSuperview().inset(47)
            $0.height.equalTo(39)
        }
        
        multiplusButton.snp.makeConstraints {
            $0.top.equalTo(minusButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(46)
            $0.trailing.equalToSuperview().inset(47)
            $0.height.equalTo(39)
        }
        
        divisButton.snp.makeConstraints {
            $0.top.equalTo(multiplusButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(46)
            $0.trailing.equalToSuperview().inset(47)
            $0.height.equalTo(39)
        }
    }
    
    override func configUI() {
        self.backgroundColor = .white
    }
}

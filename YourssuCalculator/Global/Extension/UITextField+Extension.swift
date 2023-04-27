//
//  UITextField+Extesnion.swift
//  YourssuCalculator
//
//  Created by 홍준혁 on 2023/04/26.
//

import Foundation
import UIKit.UITextField

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

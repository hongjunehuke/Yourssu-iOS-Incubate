//
//  UIView+Extension.swift
//  YourssuCalculator
//
//  Created by 홍준혁 on 2023/04/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

//
//  BaseUIView.swift
//  YourssuCalculator
//
//  Created by 홍준혁 on 2023/04/26.
//

import UIKit

class BaseUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        
    }
    
    func configUI() {
        
    }
}

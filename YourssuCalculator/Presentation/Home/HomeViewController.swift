//
//  ViewController.swift
//  YourssuCalculator
//
//  Created by 홍준혁 on 2023/04/26.
//

import UIKit

import SnapKit

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private var homeViewModel: HomeViewModelInputOutput?
    
    init(viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView() {
        self.view = homeView
    }
    
    private func bind() {
        homeViewModel?.calculatorStatus = { [weak self] text in
            self?.homeView.textLabel.text = text
        }
        setButtonAction()
        setupNotificationCenter()
    }
}

// MARK: - set notification

private extension HomeViewController {
    func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(firstTextFieldDidChange), name: UITextField.textDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(secondTextFieldDidChange), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    @objc func firstTextFieldDidChange(noti: NSNotification) {
        guard let text = homeView.firstNumTextField.text,
              let textToInt = Int(text) else {
            self.homeViewModel?.firstTextFieldStartTyping(num: Int())
            return
        }
        self.homeViewModel?.firstTextFieldStartTyping(num: textToInt)
    }
    
    @objc func secondTextFieldDidChange(noti: NSNotification) {
        guard let text = homeView.secondNumTextField.text,
              let textToInt = Int(text) else {
            self.homeViewModel?.secondTextFieldStartTyping(num: Int())
            return
        }
        self.homeViewModel?.secondTextFieldStartTyping(num: textToInt)
    }
}

// MARK: - set button Action

private extension HomeViewController {
    func setButtonAction() {
        homeView.plusButton.addTarget(self, action: #selector(plusButtonDidTap), for: .touchUpInside)
        homeView.minusButton.addTarget(self, action: #selector(minusButtonDidTap), for: .touchUpInside)
        homeView.multiplusButton.addTarget(self, action: #selector(multiplusButtonDidTap), for: .touchUpInside)
        homeView.divisButton.addTarget(self, action: #selector(divisButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    func plusButtonDidTap() {
        self.homeViewModel?.plusButtonDidTap()
    }
    
    @objc
    func minusButtonDidTap() {
        self.homeViewModel?.minusButtonDidTap()
    }
    
    @objc
    func multiplusButtonDidTap() {
        self.homeViewModel?.multiplusButtonDidTap()
    }
    
    @objc
    func divisButtonDidTap() {
        self.homeViewModel?.divisButtonDidTap()
    }
}

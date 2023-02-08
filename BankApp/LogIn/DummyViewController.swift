//
//
// BankApp
// 
// DummyViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit

class DummyViewController: UIViewController {

    // MARK: - Properties
    
    let verticalStackView = UIStackView()
    let welcomeLabel = UILabel()
    let logoutButton = UIButton(type: .system)
    
    // signal the logout
    weak var logoutDelegate: LogoutDelegate?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    
        styleUI()
        layoutUI()
    }
}

// MARK: - Extension StyleUI and LayoutUI

extension DummyViewController {
    func styleUI() {
        // verticalStackView
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 20
        
        // welcomeLabel
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        // logoutButton
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    }
    
    func layoutUI() {
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(welcomeLabel)
        verticalStackView.addArrangedSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc func logoutButtonTapped(sender: UIButton) {
        logoutDelegate?.didLogout()
    }
}

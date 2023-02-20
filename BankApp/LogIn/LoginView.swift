//
//
// BankApp
// 
// LoginView.swift
//
// Created by Royal Blue Software
// 


import UIKit

class LoginView: UIView {
    
    // MARK: - UI Properties
    
    let verticalStackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        styleUI()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension

extension LoginView {
    
    // MARK: - UI Setup Functions
    
    private func styleUI() {
        // view
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
        clipsToBounds = true
        
        // vertical stackView
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        
        // usernameTextField
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.delegate = self
        usernameTextField.placeholder = "Username"
        
        // dividerView
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        // passwordTextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        passwordTextField.enablePasswordToggle()
    }
    
    private func layoutUI() {
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(usernameTextField)
        verticalStackView.addArrangedSubview(dividerView)
        verticalStackView.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

// MARK: - UITextFieldDelegate

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}

//
//
// BankApp
// 
// OnboardingViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Properties
    
    let verticalStackView = UIStackView()
    let mainImageView = UIImageView()
    let titleLabel = UILabel()

    let mainImageName: String
    let titleText: String
    
    // MARK: - Initializer
    
    init(mainImageName: String, titleText: String) {
        self.mainImageName = mainImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleUI()
        layoutUI()
    }
}

// MARK: - Extension Style and Layout

extension OnboardingViewController {
    func styleUI() {
        view.backgroundColor = .systemBackground
        
        // verticalStackView
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 20
        
        // image
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.image = UIImage(named: mainImageName)
        
        // titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.text = titleText
    }
    
    func layoutUI() {
        verticalStackView.addArrangedSubview(mainImageView)
        verticalStackView.addArrangedSubview(titleLabel)
        view.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
}

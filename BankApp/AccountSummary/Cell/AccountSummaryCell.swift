//
//
// BankApp
// 
// AccountSummaryCell.swift
//
// Created by Royal Blue Software
// 


import UIKit

class AccountSummaryCell: UITableViewCell {
    
    // MARK: - Enum Properties
    // could be moved out to seperate files
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        
        // configure to accept decimals
        let balance: Decimal
        
        var balanceAsAttributedString: NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    
    // MARK: - ViewModel Properties
    
    let viewModel: ViewModel? = nil
    
    // MARK: - Properties
    
    let typeLabel = UILabel()
    let underLineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    
    private func setupUI() {
        // typeLabel
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        
        // underLineView
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        underLineView.backgroundColor = appColor
        
        // nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontSizeToFitWidth = true
        
        // balanceStackView
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        // balanceLabel
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        balanceLabel.adjustsFontSizeToFitWidth = true
        
        // balanceAmountLabel
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .right
        balanceAmountLabel.attributedText = makeFormattedBalance(dollars: "XXX,XXX", cents: "XX")
        
        // chevronImageView
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        
        // contentView - typeLabel, underLineView, nameLabel
        contentView.addSubview(typeLabel) // must add to contentView
        contentView.addSubview(underLineView)
        contentView.addSubview(nameLabel)
        
        // balanceStackView - balanceLabel, balanceAmountLabel
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        contentView.addSubview(balanceStackView)
        
        // chevronImageView
        contentView.addSubview(chevronImageView)
    }
    
    private func layoutUI() {
        NSLayoutConstraint.activate([
            // typeLabel constraints
            typeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            // underLineView constraints
            underLineView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 4),
            underLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            underLineView.widthAnchor.constraint(equalToConstant: 60),
            underLineView.heightAnchor.constraint(equalToConstant: 4),
            
            // nameLabel constraints
            nameLabel.topAnchor.constraint(equalTo: underLineView.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            // balanceStackView constraints
            balanceStackView.topAnchor.constraint(equalTo: underLineView.bottomAnchor),
            balanceStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            balanceStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            // chevronImageView constraints
            chevronImageView.topAnchor.constraint(equalTo: underLineView.bottomAnchor, constant: 8),
            chevronImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
        ])
    }
}

// MARK: - Extension NSAttributed Strings

extension AccountSummaryCell {
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
       return rootString
    }
}

// MARK: - Extension ViewModel Configuration

extension AccountSummaryCell {
    func configure(with viewModel: ViewModel) {
        
        typeLabel.text = viewModel.accountType.rawValue
        nameLabel.text = viewModel.accountName
        balanceAmountLabel.attributedText = viewModel.balanceAsAttributedString
        
        switch viewModel.accountType {
        case .Banking:
            underLineView.backgroundColor = appColor
            balanceLabel.text = "Current Balance"
        
        case .CreditCard:
            underLineView.backgroundColor = .systemOrange
            balanceLabel.text = "Current Balance"
            
        case .Investment:
            underLineView.backgroundColor = .systemPurple
            balanceLabel.text = "Value"
        }
    }
}

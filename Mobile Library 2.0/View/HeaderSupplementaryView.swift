//
//  HeaderSupplementaryView.swift
//  Mobile Library 2.0
//
//  Created by Максим on 16.10.2022.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "header"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerLabel)
        backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(objectName: String) {
        headerLabel.text = objectName
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
}

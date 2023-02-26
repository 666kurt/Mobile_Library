//
//  RecomendationCollectionViewCell.swift
//  Mobile Library 2.0
//
//  Created by Максим on 16.10.2022.
//

import UIKit

class RecomendationCollectionViewCell: UICollectionViewCell {
    
    private let recomendationImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "algebraBook")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let recomendationBookLabel: UILabel = {
        let label = UILabel()
        label.text = "Алгебра"
        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir", size: 13)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraint()
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(recomendationBookLabel)
        addSubview(recomendationImageView)
    }
    
    func configureCell(recomendationBookImage: String, bookTitle: String) {
//        recomendationImageView.load(url: recomendationBookImage)
        recomendationImageView.image = UIImage(named: recomendationBookImage)
        recomendationBookLabel.text = bookTitle
    }
    
}

extension RecomendationCollectionViewCell {
    
     private func setConstraint() {
        
        NSLayoutConstraint.activate([
            
            recomendationImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            recomendationImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recomendationImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recomendationImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            recomendationBookLabel.topAnchor.constraint(equalTo: recomendationImageView.bottomAnchor, constant: 10),
            recomendationBookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            recomendationBookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            recomendationBookLabel.heightAnchor.constraint(equalToConstant: 16)
                
        ])
    }
}

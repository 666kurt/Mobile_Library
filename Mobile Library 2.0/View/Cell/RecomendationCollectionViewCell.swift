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
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let backgroundBookView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let recomendationBookLabel: UILabel = {
        let label = UILabel()
        label.text = "Алгебра"
        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir Bold", size: 14)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let recomendationAuthorLabel: UILabel = {
        let label = UILabel()
        label.text = "А. С. Пушкин"
        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir", size: 11)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.6465258002, green: 0.6465258002, blue: 0.6465258002, alpha: 1)
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
        
        addSubview(backgroundBookView)
        backgroundBookView.addSubview(recomendationImageView)
        addSubview(recomendationBookLabel)
        addSubview(recomendationAuthorLabel)
    }
    
    func configureCell(recomendationBookImage: URL, bookTitle: String) {
        recomendationImageView.load(url: recomendationBookImage)
   //     recomendationImageView.image = UIImage(named: recomendationBookImage)
        recomendationBookLabel.text = bookTitle
    }
    
}

extension RecomendationCollectionViewCell {
    
     private func setConstraint() {
        
        NSLayoutConstraint.activate([
            
            backgroundBookView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            backgroundBookView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            backgroundBookView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            backgroundBookView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -98),
            
            recomendationImageView.topAnchor.constraint(equalTo: backgroundBookView.topAnchor, constant: 20),
            recomendationImageView.leadingAnchor.constraint(equalTo: backgroundBookView.leadingAnchor, constant: 20),
            recomendationImageView.trailingAnchor.constraint(equalTo: backgroundBookView.trailingAnchor, constant: -20),
            recomendationImageView.bottomAnchor.constraint(equalTo: backgroundBookView.bottomAnchor, constant: -20),
            
            recomendationBookLabel.topAnchor.constraint(equalTo: backgroundBookView.bottomAnchor, constant: 10),
            recomendationBookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            recomendationBookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            recomendationAuthorLabel.topAnchor.constraint(equalTo: recomendationBookLabel.bottomAnchor, constant: 10),
            recomendationAuthorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            recomendationAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

                
        ])
    }
}

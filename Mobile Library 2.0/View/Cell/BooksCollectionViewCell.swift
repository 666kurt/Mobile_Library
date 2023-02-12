//
//  BooksCollectionViewCell.swift
//  Mobile Library 2.0
//
//  Created by Максим on 09.02.2023.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {
    
    private var bookImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "algebraBook")
        image.layer.cornerRadius = 8
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var bookTitle: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont(name: "Avenir Bold", size: 16)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bookAuthor: UILabel = {
        let label = UILabel()
        label.text = "Author"
        label.font = UIFont(name: "Avenir", size: 12)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundColor = .red
        
        addSubview(bookImage)
        addSubview(bookTitle)
        addSubview(bookAuthor)
    }
    
}

extension BooksCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            bookImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bookImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bookImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            bookImage.heightAnchor.constraint(equalToConstant: 200),
            
            bookTitle.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 2),
            bookTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bookTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            bookAuthor.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 2),
            bookAuthor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bookAuthor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        
        ])
    }
    
}

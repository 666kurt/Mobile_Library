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
        image.layer.cornerRadius = 8
        image.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var bookTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Bold", size: 18)
        label.textColor = .black
        label.numberOfLines = 3
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bookAuthor: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .black
        label.numberOfLines = 3
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configureCell(title: String, author: String, image: URL) {
        bookTitle.text = title
        bookAuthor.text = author
        bookImage.load(url: image)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
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
            bookImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            bookImage.widthAnchor.constraint(equalToConstant: 120),
            
            bookTitle.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bookTitle.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 8),
            bookTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            bookAuthor.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 8),
            bookAuthor.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 8),
            bookAuthor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        
        ])
    }
    
}

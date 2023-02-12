//
//  ObjectCollectionViewCell.swift
//  Mobile Library 2.0
//
//  Created by Максим on 16.10.2022.
//

import UIKit

class ObjectCollectionViewCell: UICollectionViewCell {
    
    private let objectLabel: UILabel = {
       let label = UILabel()
        label.text = "Object"
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 13)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let objectImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "math")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        
        backgroundColor = .white
        layer.cornerRadius = 8
        
        addSubview(objectLabel)
        addSubview(objectImageView)
    }
    
    func configureCell(objectName: String, imageName: String) {
        objectLabel.text = objectName
        objectImageView.image = UIImage(named: imageName)
    }
    
}

extension ObjectCollectionViewCell {
    
    private func setConstraint() {
        
        NSLayoutConstraint.activate([

            objectImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            objectImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            objectImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            objectLabel.topAnchor.constraint(equalTo: objectImageView.bottomAnchor, constant: 5),
            objectLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            objectLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            objectLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            objectLabel.heightAnchor.constraint(equalToConstant: 16)
        
        ])
    }
}

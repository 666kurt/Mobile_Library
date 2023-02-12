//
//  MathCollectionViewController.swift
//  Mobile Library 2.0
//
//  Created by Максим on 18.11.2022.
//

import UIKit

class DetailCollectionViewController: UICollectionViewController {
    
    private var sections: [ListItem]!
    
    private let reuseIdentifier = "Cell"
    
    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(RecomendationCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    
    init(dataSource: [ListItem]) {
        super.init(collectionViewLayout: layout)
        self.sections = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RecomendationCollectionViewCell
        
        return cell
    }
}

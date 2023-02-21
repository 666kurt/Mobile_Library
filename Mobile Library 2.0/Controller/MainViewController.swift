//
//  ViewController.swift
//  Mobile Library 2.0
//
//  Created by Максим on 16.10.2022.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let headerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "headerimageview")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let sections = MockData.shared.pageData
    private let books: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setDelegates()
        setupView()
        setConstraint()
        
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupView() {
        
        view.backgroundColor = #colorLiteral(red: 0.9688282609, green: 0.9691237807, blue: 0.9782338738, alpha: 1)
        
        view.addSubview(collectionView)
        view.addSubview(headerImageView)
        
        collectionView.register(ObjectCollectionViewCell.self,
                                forCellWithReuseIdentifier: "idObjectCollectionViewCell")
        collectionView.register(RecomendationCollectionViewCell.self,
                                forCellWithReuseIdentifier: "idRecomendationCollectionViewCell")
        collectionView.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "HeaderSupplementaryView")
        collectionView.collectionViewLayout = createLayout()
    }
}


// MARK: - Create layout

extension MainViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {

        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {

            case .objects(_):
                return self.createObjectSection()
            case .recomendation(_):
                return self.createRecomendationSection()
            }
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItem: [NSCollectionLayoutBoundarySupplementaryItem],
                                     contentInsert: Bool) -> NSCollectionLayoutSection {
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItem
        section.supplementariesFollowContentInsets = contentInsert
        return section
    }
    
    private func SupplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
        
    }
    
    private func createObjectSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.1)),
                                                       subitems: [item])
        group.interItemSpacing = .flexible(10)
        
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 30,
                                          supplementaryItem: [SupplementaryHeaderItem()],
                                          contentInsert: false)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 20, trailing: 10)
        return section
    }
    
    private func createRecomendationSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(0.5)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.3),
                                                                         heightDimension: .fractionalHeight(0.5)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 20,
                                          supplementaryItem: [SupplementaryHeaderItem()],
                                          contentInsert: false)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 0)
        return section
    }
}




// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch sections[indexPath.section] {
            
        case .objects(let objects):
            let vc = BooksViewController()
            vc.title = objects[indexPath.row].title
            navigationController?.pushViewController(vc, animated: true)
        case .recomendation(_):
            print("tap")
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        sections[section].count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
            
        case .objects(let objects):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idObjectCollectionViewCell",
                                                                for: indexPath) as? ObjectCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(objectName: objects[indexPath.row].title,
                               imageName: objects[indexPath.row].image)
            return cell

        case .recomendation(let recomendation):
            guard let cell = collectionView.dequeueReusableCell(
                                                                withReuseIdentifier: "idRecomendationCollectionViewCell",
                                                                for: indexPath) as? RecomendationCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(recomendationBookImage: recomendation[indexPath.row].image,
                               bookTitle: recomendation[indexPath.row].title)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "HeaderSupplementaryView",
                                                                         for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(objectName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}


// MARK: - setConstraint()

extension MainViewController {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            headerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerImageView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
}




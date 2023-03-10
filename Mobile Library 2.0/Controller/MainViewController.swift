//
//  ViewController.swift
//  Mobile Library 2.0
//
//  Created by Максим on 16.10.2022.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate {
    
    lazy var firstSection: [Book] = {
        books.filter { $0.category == "math" }
    }()
    
    lazy var secondSection: [Book] = {
        books.filter { $0.category == "eng" }
    }()
    
    lazy var thirdSection: [Book] = {
        books.filter { $0.category == "chemical" }
    }()
    
    lazy var fourthSection: [Book] = {
        books.filter { $0.category == "literature" }
    }()
    
    lazy var fifthSection: [Book] = {
        books.filter { $0.category == "geography" }
    }()
    
    lazy var sixthSection: [Book] = {
        books.filter { $0.category == "physical" }
    }()
    
    var recomendationSection: [Book] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        collectionView.bounces = false
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let headerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
       return image
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Мобильная библиотека"
        label.font = UIFont(name: "SF Pro Display", size: 16)
        label.textColor = #colorLiteral(red: 0.2658094764, green: 0.3961576819, blue: 0.4681692719, alpha: 1)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private let searchBar: UISearchBar = {
//       let bar = UISearchBar()
//        bar.placeholder = "Поиск"
//        bar.searchBarStyle = .minimal
//        bar.translatesAutoresizingMaskIntoConstraints = false
//        return bar
//    }()
    
    private let sections = MockData.shared.pageData
    private var books: [Book] = [] {
        didSet {
            recomendationSection = books.filter { $0.isRecommended == true }
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
        setupView()
        setConstraint()
        
        APIManager.shared.fetchData { [weak self] book in
            DispatchQueue.main.async {
                guard let self else { return }
                self.books = book!
            }
        }
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        view.addSubview(mainLabel)
        view.addSubview(logoImage)
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
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
                                heightDimension: .estimated(60)),
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
                                          interGroupSpacing: 16,
                                          supplementaryItem: [SupplementaryHeaderItem()],
                                          contentInsert: false)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 10, trailing: 16)
        return section
    }
    
    private func createRecomendationSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(0.5)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.44),
                                                                         heightDimension: .fractionalHeight(0.86)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 10,
                                          supplementaryItem: [SupplementaryHeaderItem()],
                                          contentInsert: false)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 0)
        return section
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch sections[indexPath.section] {
            
        case .objects(let objects):
                    
            let vc = BooksViewController()
            let categoryID = objects[indexPath.row].id
            
            switch categoryID {
            case 1: vc.books = firstSection
            case 2: vc.books = secondSection
            case 3: vc.books = thirdSection
            case 4: vc.books = fourthSection
            case 5: vc.books = fifthSection
            case 6: vc.books = sixthSection
            default:
                return
            }
    
            vc.title = objects[indexPath.row].title
            navigationController?.pushViewController(vc, animated: true)
        case .recomendation(_):
            let vc = PDFViewController()
            let recommendationInfo = recomendationSection[indexPath.row]
            vc.openBook(url: recommendationInfo.url)
            vc.title = recommendationInfo.title
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return section == 0 ? sections[section].count : recomendationSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
            
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idObjectCollectionViewCell",
                                                                for: indexPath) as? ObjectCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.layer.cornerRadius = 8
            cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.06).cgColor
            cell.layer.shadowOpacity = 1
            cell.layer.shadowRadius = 9
            cell.layer.shadowOffset = CGSize(width: 0, height: 2)
            
            let objects = sections[0].items[indexPath.row]
            
            cell.configureCell(objectName: objects.title,
                               imageName: objects.image)
            return cell

        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                                                                withReuseIdentifier: "idRecomendationCollectionViewCell",
                                                                for: indexPath) as? RecomendationCollectionViewCell
            else {
                return UICollectionViewCell()
            }
    
            cell.layer.cornerRadius = 8
            cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.06).cgColor
            cell.layer.shadowOpacity = 1
            cell.layer.shadowRadius = 9
            cell.layer.shadowOffset = CGSize(width: 0, height: 2)
            cell.backgroundColor = .white
            
            let recommendation = recomendationSection[indexPath.row]
            
            cell.configureCell(recomendationBookImage: recommendation.image,
                               bookTitle: recommendation.title)
            return cell
            
        default:
            return UICollectionViewCell()
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
            
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoImage.heightAnchor.constraint(equalToConstant: 29),
            logoImage.widthAnchor.constraint(equalToConstant: 36),
            
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            mainLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 8),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            searchBar.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 15),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 36),
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
//            headerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            headerImageView.heightAnchor.constraint(equalToConstant: 225),
            
        ])
    }
}




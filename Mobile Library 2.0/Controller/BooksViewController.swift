//
//  ObjectsTableViewController.swift
//  Mobile Library 2.0
//
//  Created by Максим on 08.02.2023.
//

import UIKit

class BooksViewController: UIViewController {
    
    var books: [Book] = []
    
    private let booksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        
        setupViews()
        setConstraints()
        setDelegates()


    }
    
    private func setupViews() {
        view.addSubview(booksCollectionView)
    }
    
    private func setDelegates() {
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
        booksCollectionView.register(BooksCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

}

extension BooksViewController {

    private func setConstraints() {
        NSLayoutConstraint.activate([
            booksCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            booksCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            booksCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            booksCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}

extension BooksViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width - 20
        
        return CGSize(width: width, height: width*0.55)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BooksCollectionViewCell
        let book = books[indexPath.row]
        cell.configureCell(title: book.title, author: book.author, image: book.image)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 8
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.06).cgColor
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 9
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = PDFViewController()
        
        let bookInfo = books[indexPath.row]
        
        vc.title = bookInfo.title
        vc.openBook(url: bookInfo.url)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}


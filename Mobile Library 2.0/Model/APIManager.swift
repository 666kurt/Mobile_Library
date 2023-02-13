//
//  APIManager.swift
//  Mobile Library 2.0
//
//  Created by Максим on 11.02.2023.
//

import Foundation
import FirebaseFirestore

struct Books: Codable {
    let math: Book
    let english: Book
    let literature: Book
}

struct Book: Codable {
    let name: String
    let author: String
    let url: String
    let image: String
}

    
func getData() {
    
    let db = Firestore.firestore()
    
    db.collection("books").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                
                let data = document.data()
                
                let bookTitle = data["title"] as? String ?? ""
                let bookAuthor = data["author"] as? String ?? ""
                let bookImage = data["image"] as? String ?? ""
                let bookUrl = data["url"] as? String ?? ""
                
                let books = Book(name: bookTitle, author: bookAuthor, url: bookUrl, image: bookImage)
                print(books)

            }
        }
    }
}


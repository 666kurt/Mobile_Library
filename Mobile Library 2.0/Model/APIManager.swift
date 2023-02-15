//
//  APIManager.swift
//  Mobile Library 2.0
//
//  Created by Максим on 11.02.2023.
//

import Foundation
import FirebaseFirestore

struct Book: Codable {
    var id: String
    let title: String
    let author: String
    let url: String
    let image: String
    
    init(id: String, title: String, author: String, url: String, image: String) {
        self.id = id
        self.title = title
        self.author = author
        self.image = image
        self.url = url
    }
}



class APIManager {

    static let shared = APIManager()

    var book = [Book]()
    
    func fetchBook(documentId: String) {
        
        var book = [Book]()
        
        let db = Firestore.firestore()
        let docRef = db.collection("books").document(documentId)

        docRef.getDocument { document, error in
            if let error = error as NSError? {
                print("Error getting document: \(error.localizedDescription)")
            } else {
                if let document = document {
                    do {
                        self.book = try document.data(as: Book.self)
                    } catch {
                        print(error)
                    }
          }
        }
      }
    }



}



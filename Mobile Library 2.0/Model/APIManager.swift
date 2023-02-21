//
//  APIManager.swift
//  Mobile Library 2.0
//
//  Created by Максим on 11.02.2023.
//

import Foundation
import FirebaseFirestore

class APIManager {
    
    @Published var books = [Book]()

    static let shared = APIManager()
    
    private func configureFB() -> Firestore {
        
        let db: Firestore!
        let setting = FirestoreSettings()
        Firestore.firestore().settings = setting
        db = Firestore.firestore()
        
        return db
    }
    
    
    func fetchData(completion: @escaping ([Book]?) -> Void) {
        
        let db = configureFB()
        
        db.collection("books").getDocuments { (querySnapshot, error) in
            
            guard let document = querySnapshot?.documents else {
                print("no document")
                return
            }
            
            self.books = document.compactMap { (queryDocumentSnapshot) -> Book? in
                return try? queryDocumentSnapshot.data(as: Book.self)
            }
            print(self.books)
            completion(self.books)
        }
    }

}



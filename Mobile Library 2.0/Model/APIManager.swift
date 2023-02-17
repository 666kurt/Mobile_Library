//
//  APIManager.swift
//  Mobile Library 2.0
//
//  Created by Максим on 11.02.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Book: Codable {
    @DocumentID var id: String? = UUID().uuidString
    let author: String
    let title: String
    let url: String
}



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
    
    
    func fetchData() {
        
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
            
        }
    }
    

//    func getPost(collection: String, docName: String, completion: @escaping (Book?) -> Void) {
//
//        let db = configureFB()
//        db.collection(collection).document().getDocument(completion: { (document, error) in
//            guard error == nil else { completion(nil); return }
//
//            print(document)
//            completion(document)
//        })
//
//    }

}



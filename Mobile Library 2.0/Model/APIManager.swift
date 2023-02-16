//
//  APIManager.swift
//  Mobile Library 2.0
//
//  Created by Максим on 11.02.2023.
//

import Foundation
import FirebaseFirestore

struct Book {
    let author: String
    let title: String
    let url: String
}



class APIManager {

    static let shared = APIManager()
    
    private func configureFB() -> Firestore {
        
        let db: Firestore!
        let setting = FirestoreSettings()
        Firestore.firestore().settings = setting
        db = Firestore.firestore()
        
        return db
    }

    func getPost(collection: String, docName: String, completion: @escaping (Book?) -> Void) {
        
        let db = configureFB()
        db.collection(collection).document().getDocument(completion: { (document, error) in
            guard error == nil else { completion(nil); return }
            let document = Book(author: document?.get("author") as! String,
                                title: document?.get("title") as! String,
                                url: document?.get("url") as! String)
            print(document)
            completion(document)
        })
        
    }

}



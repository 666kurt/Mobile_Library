//
//  APIManager.swift
//  Mobile Library 2.0
//
//  Created by Максим on 11.02.2023.
//

import Foundation
import FirebaseFirestore

func getData() {
    
    let db = Firestore.firestore()
    
    db.collection("books").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
    
    
}

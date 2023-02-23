//
//  ListItem.swift
//  Mobile Library 2.0
//
//  Created by Максим on 16.10.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct ListItem {
    let title: String
    let image: String
}

struct Book: Codable {
    @DocumentID var id: String? = UUID().uuidString
    let author: String
    let title: String
    let url: String
    let category: String
}

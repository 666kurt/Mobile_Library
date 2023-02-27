//
//  MockData.swift
//  Mobile Library 2.0
//
//  Created by Максим on 16.10.2022.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let objects: ListSection = {
        .objects([.init(title: "Алгебра", image: "math", id: 1),
                  .init(title: "Английский", image: "english", id: 2),
                  .init(title: "Химия", image: "chemical", id: 3),
                  .init(title: "Литература", image: "literature", id: 4),
                  .init(title: "География", image: "geography", id: 5),
                  .init(title: "Физика", image: "physical", id: 6)])
        }()
    
    private let recomendation: ListSection = {
        .recomendation([ListItem]())
    }()
    
    var pageData: [ListSection] {
        [objects, recomendation]
    }
    
}


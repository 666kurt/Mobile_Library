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
        .recomendation([.init(title: "Алгебра", image: "algebraBook", id: 1),
                        .init(title: "Физика", image: "fizikaBook", id: 2),
                        .init(title: "Литература", image: "literatureBook", id: 3),
                        .init(title: "Геометрия", image: "geometryBook", id: 4),
                        .init(title: "Английский язык", image: "spotlightBook", id: 5)])
    }()
    
    var pageData: [ListSection] {
        [objects, recomendation]
    }
    
}


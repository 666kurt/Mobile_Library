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
        .objects([.init(title: "Алгебра", image: "math"),
                  .init(title: "Английский", image: "english"),
                  .init(title: "Химия", image: "chemical"),
                  .init(title: "Литература", image: "literature"),
                  .init(title: "География", image: "geography"),
                  .init(title: "Физика", image: "physical")])
        }()
    
    private let recomendation: ListSection = {
        .recomendation([.init(title: "Алгебра", image: "algebraBook"),
                        .init(title: "Физика", image: "fizikaBook"),
                        .init(title: "Литература", image: "literatureBook"),
                        .init(title: "Геометрия", image: "geometryBook"),
                        .init(title: "Английский язык", image: "spotlightBook")])
    }()
    
    private let books: ListSection = {
        .recomendation([.init(title: "Book1", image: "algebraBook"),
                        .init(title: "Book2", image: "fizikaBook"),
                        .init(title: "Book3", image: "literatureBook"),
                        .init(title: "Book4", image: "geometryBook"),
                        .init(title: "Book5", image: "spotlightBook")])
    }()
    
    var pageData: [ListSection] {
        [objects, recomendation]
    }
    
}


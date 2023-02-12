//
//  ListSection.swift
//  Mobile Library 2.0
//
//  Created by Максим on 16.10.2022.
//

import Foundation

enum ListSection {
    
    case objects([ListItem])
    case recomendation([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .objects(let items),
                .recomendation(let items):
            return items
        }
    }
        
    var count: Int {
        items.count
    }
        
    var title: String {
        switch self {
            case .objects(_):
                return "Предметы"
            case .recomendation(_):
                return "Рекомендуемое"
            }
            
        }
}

//
//  NavItem.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import Foundation
import SwiftData

@Model
final class NavItem : Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case title
        case type
    }
    
    var id: UUID = UUID()
    
    var title: String
    var type: AssistType
    
    
    init (title: String, type: AssistType) {
        self.title = title
        self.type = type
    }
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        type = try container.decode(AssistType.self, forKey: .type)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(type, forKey: .type)
    }
}

// Get total list of nav items
func getNavItems() -> [NavItem] {
    var navs : [NavItem] = []
    
    AssistType.allCases.forEach { type in
        let nav = NavItem(title: type.rawValue, type: type)
        navs.append(nav)
    }
    
    return navs
}

//
//  NavItem.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import Foundation
import SwiftData

@Model
final class NavItem {
    var title: String
    var type: AssistType
    
    
    init (title: String, type: AssistType) {
        self.title = title
        self.type = type
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

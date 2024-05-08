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
    
    init (title: String) {
        self.title = title
    }
}

// Get total list of nav items
func getNavItems() -> [NavItem] {
    var navs : [NavItem] = []
    
    let googleNav = NavItem(title: "Googling")
    navs.append(googleNav)
    
    return navs
}

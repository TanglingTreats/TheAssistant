//
//  AppData.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import Foundation

class AppData: ObservableObject {
    @Published var hasResults: Bool
    var showWindow: Bool
    var assist: AssistType
    
    init() {
        hasResults = false
        showWindow = false
        assist = AssistType.search
    }
}

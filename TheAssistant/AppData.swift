//
//  AppData.swift
//  Playground
//
//  Created by Edwin Tang on 8/5/24.
//

import Foundation

class AppData: ObservableObject {
    @Published var hasResults: Bool
    @Published var showWindow: Bool
    
    init() {
        hasResults = false
        showWindow = false
    }
}

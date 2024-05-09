//
//  GoogleGround.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import Foundation

// Send query to backend to process data
func googleQuery(_ query: String, _ appData: AppData) {
    appData.hasResults = true;
    appData.assist = .search
}

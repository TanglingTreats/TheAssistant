//
//  AssistantSettings.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import SwiftUI

struct AssistantSettings: View {
    enum SettingType: String, CaseIterable, Codable {
        case search = "Search"
        case delegate = "Delegate"
    }
    @State var selectedType: SettingType = SettingType.search
    
    var body: some View {
            VStack(alignment: .center, spacing: 20){
                ControlGroup{
                    Button("Search"){ selectedType = .search }
                    Button("Delegate"){ selectedType = .delegate }
                }
                
                VStack(alignment: .center) {
                    switch (selectedType) {
                    case .search:
                        Text("Search")
                    case .delegate:
                        Text("Delegate")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
            }
            .padding()
            .frame(minWidth: 700, minHeight: 400)
    }
}

#Preview {
    AssistantSettings()
}

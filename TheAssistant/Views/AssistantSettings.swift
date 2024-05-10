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
            VStack(alignment: .center, spacing: 15){
                ControlGroup{
                    // Could probably optimise the buttons
                    Button("Search"){ selectedType = .search }
                    Button("Delegate"){ selectedType = .delegate }
                }
                
                VStack(alignment: .leading) {
                    switch (selectedType) {
                    case .search:
                        Form {
                            Text("Search")
                        }
                    case .delegate:
                        Form {
                            Text("Delegate")
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background()
                .cornerRadius(8.0)
            }
            .padding()
            .frame(minWidth: 700, minHeight: 400)
    }
}

#Preview {
    AssistantSettings()
}

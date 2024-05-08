//
//  AppMenu.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import SwiftUI

struct AppMenu: View {
    @State private var query: String = ""
    @FocusState private var searchFieldIsFocused: Bool
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("The Assistant")
            TextField("What do you want to Google?", text: $query)
                .padding(3)
                .textFieldStyle(.roundedBorder)
                .focused($searchFieldIsFocused)
                .onSubmit{googleQuery(query, appData)}
            HStack() {
                if(appData.hasResults) {
                        Spacer()
                        Button("Show Result", action: viewResults)
                            .labelStyle(.titleOnly)
                }
            }
        }
        .padding([.all], 10)
        .environmentObject(appData)
    }
}
func viewResults() {
    
}

#Preview {
    AppMenu()
        .environmentObject(AppData())
}

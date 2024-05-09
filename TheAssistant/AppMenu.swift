//
//  AppMenu.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import SwiftUI

struct AppMenu: View {
    @State private var query: String = ""
    @Binding var selection: NavItem?
    
    @FocusState private var searchFieldIsFocused: Bool
    @EnvironmentObject var appData: AppData
    
    @Environment(\.openWindow) private var openWindow

    let navs : [NavItem]
    
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
    
    func viewResults() {
        selection = navs.first(where: {$0.type == .search})
        openWindow(id: "main")
    }
}

#Preview {
    @State var selection: NavItem?
    
    return AppMenu(selection: $selection, navs: getNavItems())
        .environmentObject(AppData())
}

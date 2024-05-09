//
//  TheAssistantApp.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import SwiftUI
import SwiftData

@main
struct TheAssistantApp: App {
    // Global app state
    @StateObject var appData = AppData()
    @State private var selection: NavItem?

    var sharedModelContainer: ModelContainer = {
        
        let schema = Schema([
            NavItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            var container = try ModelContainer(for: schema, configurations: [modelConfiguration])

            let navs = getNavItems()
            var itemFetchDescriptor = FetchDescriptor<NavItem>()
            itemFetchDescriptor.fetchLimit = navs.count
            
            let navsCount = try container.mainContext.fetch(itemFetchDescriptor).count
            
            guard navsCount == navs.count else { return container }

            
            return container
            
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    let navs = getNavItems()

    var body: some Scene {
        
        MenuBarExtra("TheAssistant", systemImage: "tent.2.fill") {
            AppMenu(selection: $selection, navs: navs)
                .environmentObject(appData)
        }
        .menuBarExtraStyle(.window)
        
        Window("The Assistant", id: "main") {
            ContentView(selection: $selection, navs: navs)
                .environmentObject(appData)
        }
        .commands{AssistantCommands()}
        .modelContainer(sharedModelContainer)
        
        Settings {
            AssistantSettings()
        }
    }
}

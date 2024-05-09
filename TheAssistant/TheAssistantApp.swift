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
    
    var sharedModelContainer: ModelContainer = {
        
        let schema = Schema([
            NavItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            var itemFetchDescriptor = FetchDescriptor<NavItem>()
            itemFetchDescriptor.fetchLimit = 1
            
            guard try container.mainContext.fetch(itemFetchDescriptor).count == 0 else { return container }

            let navs = getNavItems()
            for nav in navs {
                container.mainContext.insert(nav)
            }
            
            return container
            
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    

    var body: some Scene {
        
        MenuBarExtra("TheAssistant", systemImage: "tent.2.fill") {
            AppMenu()
                .environmentObject(appData)
        }
        .menuBarExtraStyle(.window)
        
        Window("The Assistant", id: "main") {
            ContentView()
                .environmentObject(appData)
        }
        .commands{AssistantCommands()}
        .modelContainer(sharedModelContainer)
        
        Settings {
            AssistantSettings()
        }
    }
}

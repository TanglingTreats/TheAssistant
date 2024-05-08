//
//  ContentView.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var appData: AppData
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [NavItem]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Viewing \(item.title)")
                    } label: {
                        Text(item.title)
                    }
                }
//                .onDelete(perform: deleteItems)
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
//            .toolbar {
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
        } detail: {
            Text("Select a function")
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    let previewContainer: ModelContainer = {
        do {
            let schema = Schema([NavItem.self])
            let container = try ModelContainer(for: schema, configurations: [ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)])
            
            let items = getNavItems()
            
            for item in items {
                container.mainContext.insert(item)
            }
            
            return container
        } catch {
            fatalError("Failed to create container")
        }
    }()
    
    return ContentView()
        .modelContainer(previewContainer)
        .environmentObject(AppData())
}

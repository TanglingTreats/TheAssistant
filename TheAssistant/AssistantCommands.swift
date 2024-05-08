//
//  AssistantCommands.swift
//  TheAssistant
//
//  Created by Edwin Tang on 8/5/24.
//

import SwiftUI

struct AssistantCommands: Commands {
    @Environment(\.openWindow) private var openWindow
    
    var body: some Commands {
        CommandGroup(replacing: .newItem) {
            Button("Open Assistant") {
                openWindow(id: "main")
            }
            .keyboardShortcut(KeyEquivalent("n"), modifiers: [.command])
        }
    }
}

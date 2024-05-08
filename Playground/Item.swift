//
//  Item.swift
//  Playground
//
//  Created by Edwin Tang on 8/5/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

//
//  Item.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 01/03/25.
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

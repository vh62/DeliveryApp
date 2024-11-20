//
//  Item.swift
//  DeliveryApp
//
//  Created by Vikram on 20/11/24.
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

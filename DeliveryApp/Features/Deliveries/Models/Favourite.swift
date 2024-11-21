//
//  Favourite.swift
//  DeliveryApp
//
//  Created by Vikram on 20/11/24.
//

import Foundation
import SwiftData

@Model
class Favorite {
    @Attribute(.unique)
    var id = UUID().uuidString
    @Relationship var delivery: Delivery?
    
    init() {
        self.delivery = nil
    }
    
    init(delivery: Delivery) {
        self.delivery = delivery
    }
}

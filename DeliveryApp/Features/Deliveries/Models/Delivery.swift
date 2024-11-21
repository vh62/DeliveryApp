//
//  Delivery.swift
//  DeliveryApp
//
//  Created by Vikram on 20/11/24.
//

import Foundation
import SwiftData

@Model
class Delivery: Decodable {
    @Attribute(.unique)
    var id: String
    var remarks: String
    var pickupTime: String
    var goodsPicture: String
    var deliveryFee: String
    var surcharge: String
    var route: Route
    var sender: Sender
    
    enum CodingKeys: String, CodingKey {
        case id
        case remarks
        case pickupTime
        case goodsPicture
        case deliveryFee
        case surcharge
        case route
        case sender
    }
    
    init() {
        self.id = UUID().uuidString
        self.remarks = ""
        self.pickupTime = ""
        self.goodsPicture = ""
        self.deliveryFee = ""
        self.surcharge = ""
        self.route = Route()
        self.sender = Sender()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        remarks = try container.decode(String.self, forKey: .remarks)
        pickupTime = try container.decode(String.self, forKey: .pickupTime)
        goodsPicture = try container.decode(String.self, forKey: .goodsPicture)
        deliveryFee = try container.decode(String.self, forKey: .deliveryFee)
        surcharge = try container.decode(String.self, forKey: .surcharge)
        route = try container.decode(Route.self, forKey: .route)
        sender = try container.decode(Sender.self, forKey: .sender)
    }
    
    init(id: String, remarks: String, pickupTime: String, goodsPicture: String, deliveryFee: String, surcharge: String, route: Route, sender: Sender) {
        self.id = id
        self.remarks = remarks
        self.pickupTime = pickupTime
        self.goodsPicture = goodsPicture
        self.deliveryFee = deliveryFee
        self.surcharge = surcharge
        self.route = route
        self.sender = sender
    }
}

//
//  Sender.swift
//  DeliveryApp
//
//  Created by Vikram on 20/11/24.
//

import Foundation
import SwiftData

@Model
class Sender: Decodable {
    var name: String
    var phone: String
    var email: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case phone
        case email
    }
    
    init() {
        self.name = ""
        self.phone = ""
        self.email = ""
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.email = try container.decode(String.self, forKey: .email)
    }
    
    init(name: String, phone: String, email: String) {
        self.name = name
        self.phone = phone
        self.email = email
    }
}

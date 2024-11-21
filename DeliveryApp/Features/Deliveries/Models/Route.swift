//
//  Route.swift
//  DeliveryApp
//
//  Created by Vikram on 20/11/24.
//

import Foundation
import SwiftData

@Model
class Route: Decodable {
    var start: String
    var end: String
    
    enum CodingKeys: String, CodingKey {
        case start
        case end
    }
    
    init() {
        self.start = ""
        self.end = ""
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.start = try container.decode(String.self, forKey: .start)
        self.end = try container.decode(String.self, forKey: .end)
    }
    
    init(start: String, end: String) {
        self.start = start
        self.end = end
    }
}

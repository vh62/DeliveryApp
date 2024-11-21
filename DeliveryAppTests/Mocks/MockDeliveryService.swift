//
//  MockDeliveryService.swift
//  DeliveryAppTests
//
//  Created by Vikram on 21/11/24.
//

import Foundation
@testable import DeliveryApp

class MockDeliveryService: DeliveryService {
    var deliveries: [Delivery] = MockDeliveryData.sampleDeliveries
    var pageCalled: Int?
    var limitCalled: Int?
    
    func getDeliveries(page: Int?, limit: Int?) async throws -> [Delivery] {
        pageCalled = page
        limitCalled = limit
        
        return deliveries
    }
}

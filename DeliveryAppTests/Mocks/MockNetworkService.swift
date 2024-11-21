//
//  MockNetworkService.swift
//  DeliveryAppTests
//
//  Created by Vikram on 21/11/24.
//

import Foundation
@testable import DeliveryApp

class MockDeliveryService: DeliveryService {
    var result: Result<[Delivery], Error> = .success([])
    
    func getDeliveries(page: Int? = nil, limit: Int? = nil) async throws -> [Delivery] {
        switch result {
        case .success(let deliveries):
            return deliveries
        case .failure(let error):
            throw error
        }
    }
}


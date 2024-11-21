//
//  MockNetworkService.swift
//  DeliveryAppTests
//
//  Created by Vikram on 22/11/24.
//

import Foundation
@testable import DeliveryApp

class MockNetworkService: NetworkService {
   var mockData: Data?
   var mockError: Error?
   
   func fetchData(from url: URL) async throws -> Data {
       if let error = mockError {
           throw error
       }
       return mockData ?? Data()
   }
}

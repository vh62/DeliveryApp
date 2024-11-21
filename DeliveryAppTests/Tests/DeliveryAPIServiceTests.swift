//
//  DeliveryAPIServiceTests.swift
//  DeliveryAppTests
//
//  Created by Vikram on 22/11/24.
//

import XCTest
@testable import DeliveryApp

final class DeliveryAPIServiceTests: XCTestCase {
   var sut: DeliveryAPIService!
   var mockNetworkService: MockNetworkService!

   override func setUp() {
       mockNetworkService = MockNetworkService()
       sut = DeliveryAPIService(networkService: mockNetworkService)
   }
   
   func assertThrowsError(_ expectedError: APIError, when block: () async throws -> Void) async {
       do {
           try await block()
           XCTFail("Expected error \(expectedError)")
       } catch let error as APIError {
           XCTAssertEqual(error, expectedError)
       } catch {
           XCTFail("Unexpected error: \(error)")
       }
   }
   
   func testBadServerResponse() async {
       mockNetworkService.mockError = URLError(.badServerResponse)
       await assertThrowsError(.invalidResponse) {
           _ = try await sut.getDeliveries()
       }
   }
   
   func testNoInternet() async {
       mockNetworkService.mockError = URLError(.notConnectedToInternet)
       await assertThrowsError(.unableToComplete) {
           _ = try await sut.getDeliveries()
       }
   }
   
    func testInvalidData() async {
        mockNetworkService.mockData = "not valid json".data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            _ = try decoder.decode([Delivery].self, from: mockNetworkService.mockData!)
        } catch {
            mockNetworkService.mockError = error
        }
        
        await assertThrowsError(.invalidData) {
            _ = try await sut.getDeliveries()
        }
    }
}

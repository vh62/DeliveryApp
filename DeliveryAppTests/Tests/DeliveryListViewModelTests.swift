//
//  DeliveryListViewModelTests.swift
//  DeliveryAppTests
//
//  Created by Vikram on 21/11/24.
//

import XCTest
import SwiftData
@testable import DeliveryApp

final class DeliveryListViewModelTests: XCTestCase {

    var sut: DeliveryListViewModel!
    var mockModelContext: ModelContext!
    var mockDeliveryService: MockDeliveryService!
    
    override func setUp() {
        super.setUp()
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(
           for: Delivery.self, Favorite.self,
           configurations: config
        )
        mockModelContext = ModelContext(container)
        mockDeliveryService = MockDeliveryService()
        sut = DeliveryListViewModel(modelContext: mockModelContext, deliveryService: mockDeliveryService)
    }
    
    override func tearDown() {
        sut = nil
        mockModelContext = nil
        mockDeliveryService = nil
        super.tearDown()
    }
    
    func testFetchDeliveries() async throws {
        
        mockDeliveryService.result = .success(MockDeliveryData.sampleDeliveries)
       
        await sut.fetchDeliveries()
        
        XCTAssert(sut.deliveries.count == MockDeliveryData.sampleDeliveries.count)
    }
    
    func testFetchDeliveriesFailure() async throws {
        
        mockDeliveryService.result = .failure(APIError.invalidData)
        
        await sut.fetchDeliveries()
        
        XCTAssert(sut.deliveries.isEmpty)
                
        XCTAssertEqual(sut.errorMessage, "Error fetching deliveries: invalidData")
    }
    
    func testFetchFavouriteData() async {
        let delivery = MockDeliveryData.sampleDeliveries[0]
        
        mockModelContext.insert(delivery)
        let favourite = Favorite(delivery: delivery)
        
        XCTAssertTrue(sut.favorites.isEmpty)
        
        await sut.toggleFavorite(delivery)
        
        await sut.fetchfavoriteData()
                
        XCTAssertFalse(sut.favorites.isEmpty)
    }
}

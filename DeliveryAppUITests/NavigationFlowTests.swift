//
//  NavigationFlowTests.swift
//  DeliveryAppUITests
//
//  Created by Vikram on 22/11/24.
//

import XCTest

final class NavigationFlowTests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func test_navigates_to_detail_view_and_back() throws {
        
        let deliveriesList = app.collectionViews.firstMatch
        XCTAssertTrue(deliveriesList.exists, "Deliveries list should exist")
        
        let firstDeliveryCell = deliveriesList.cells.element(boundBy: 0)
        XCTAssertTrue(firstDeliveryCell.waitForExistence(timeout: 5), "First delivery cell should exist")
        
        firstDeliveryCell.tap()
        
        let backButton = app.buttons["My Deliveries"]
        XCTAssertTrue(backButton.waitForExistence(timeout: 5), "Back button should exist")
        

        backButton.tap()
        XCTAssertTrue(deliveriesList.exists, "Should navigate back to deliveries list")
        
    }
}

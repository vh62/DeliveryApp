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
    
    func testDeliveryListViewHasCorrectComponents() throws {
        
        let deliveriesList = app.collectionViews.firstMatch
        XCTAssertTrue(deliveriesList.exists, "Deliveries list should exist")
        let firstDeliveryCell = deliveriesList.cells.element(boundBy: 0)
        
        let imageView = firstDeliveryCell.images.firstMatch
        XCTAssertTrue(imageView.exists, "Image view should exist")
        
        let fromText = app.staticTexts["From:"]
        XCTAssertTrue(fromText.exists, "From: text should exist")
        
        let toText = app.staticTexts["To:"]
        XCTAssertTrue(toText.exists, "To: text should exist")
    }
    
    func testDeliveryDetailViewHasCorrectComponents() throws {
        let deliveriesList = app.collectionViews.firstMatch
        let firstDeliveryCell = deliveriesList.cells.element(boundBy: 0)
        
        firstDeliveryCell.tap()
        
        let imageView = app.images.firstMatch
        XCTAssertTrue(imageView.exists, "Image view should exist")
        
        let backButton = app.buttons["My Deliveries"]
        XCTAssertTrue(backButton.exists, "Back button should exist")
        
        let fromText = app.staticTexts["From"]
        XCTAssertTrue(fromText.exists, "From text should exist")
        
        let toText = app.staticTexts["To"]
        XCTAssertTrue(toText.exists, "To text should exist")
        
        let goodToDeliverText = app.staticTexts["Goods to deliver"]
        XCTAssertTrue(goodToDeliverText.exists, "Goods to deliver text should exits")
        
        let deliveryFeeText = app.staticTexts["Delivery Fee"]
        XCTAssertTrue(deliveryFeeText.exists, "Delivery Fee text should exits")
    }
    
    func testNavigatesToDetailviewAndBack() throws {
        
        let deliveriesList = app.collectionViews.firstMatch
        
        let firstDeliveryCell = deliveriesList.cells.element(boundBy: 0)
        
        firstDeliveryCell.tap()
        
        let backButton = app.buttons["My Deliveries"]
        XCTAssertTrue(backButton.exists, "Back button should exist")
        
        backButton.tap()
        XCTAssertTrue(deliveriesList.exists, "Should navigate back to deliveries list")
    }
}


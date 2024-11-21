//
//  MockDeliveryData.swift
//  DeliveryAppTests
//
//  Created by Vikram on 21/11/24.
//

import Foundation
@testable import DeliveryApp

struct MockDeliveryData {
    static let sampleDeliveries = [
        Delivery(
            id: "5dd5f3a7156bae72fa5a5d6c",
            remarks: "Minim veniam minim nisi ullamco consequat anim reprehenderit laboris aliquip voluptate sit.",
            pickupTime: "2014-10-06T10:45:38-08:00",
            goodsPicture: "https://loremflickr.com/320/240/cat?lock=9953",
            deliveryFee: "$92.14",
            surcharge: "$136.46",
            route: Route(
                start: "Noble Street",
                end: "Montauk Court"
            ),
            sender: Sender(
                name: "Harding Welch",
                phone: "+1 (899) 523-3905",
                email: "hardingwelch@comdom.com"
            )
        ),
        Delivery(
            id: "5dd5f3a787c49789dca0b43f",
            remarks: "Minim deserunt nisi qui veniam est amet pariatur voluptate ea est exercitation cupidatat sit ea.",
            pickupTime: "2018-11-22T07:06:05-08:00",
            goodsPicture: "https://loremflickr.com/320/240/cat?lock=28542",
            deliveryFee: "$104.23",
            surcharge: "$288.13",
            route: Route(
                start: "Henry Street",
                end: "Clinton Street"
            ),
            sender: Sender(
                name: "Kendra Guthrie",
                phone: "+1 (942) 512-3379",
                email: "kendraguthrie@comdom.com"
            )
        )
    ]
}

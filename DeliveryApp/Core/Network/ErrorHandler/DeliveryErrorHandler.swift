//
//  DeliveryErrorHandler.swift
//  DeliveryApp
//
//  Created by Vikram on 23/11/24.
//

import Foundation

class DeliveryErrorHandler: ErrorHandler {
    func handle(_ error: Error) -> APIError {
        switch error {
        case URLError.badServerResponse: return .invalidResponse
        case URLError.notConnectedToInternet: return .unableToComplete
        case is DecodingError: return .invalidData
        default: return .unableToComplete
        }
    }
}

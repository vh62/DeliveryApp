//
//  ErrorHandler.swift
//  DeliveryApp
//
//  Created by Vikram on 23/11/24.
//

import Foundation

protocol ErrorHandler {
    func handle(_ error: Error) -> APIError
}

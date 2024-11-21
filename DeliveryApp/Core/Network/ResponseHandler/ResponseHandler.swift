//
//  ResponseHandler.swift
//  vikram
//
//  Created by Vikram on 20/11/24.
//

import Foundation

protocol ResponseHandler {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

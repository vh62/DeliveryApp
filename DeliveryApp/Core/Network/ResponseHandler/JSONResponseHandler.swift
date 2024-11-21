//
//  JSONResponseHandler.swift
//  vikram
//
//  Created by Vikram on 20/11/24.
//

import Foundation

class JSONResponseHandler: ResponseHandler {
    func decode<T: Decodable>(_ data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.invalidData
        }
    }
}

//
//  DeliveryURLBuilder.swift
//  vikram
//
//  Created by Vikram on 20/11/24.
//

import Foundation

class DeliveryURLBuilder: URLBuilder {
    func buildURL(endpoint: String, page: Int?, limit: Int?) throws -> URL {
        var components = URLComponents(string: endpoint)!
        
        if let page = page, let limit = limit {
            components.queryItems = [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "limit", value: "\(limit)")
            ]
        }
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        return url
    }
}

//
//  URLBuilder.swift
//  vikram
//
//  Created by Vikram on 20/11/24.
//

import Foundation

protocol URLBuilder {
    func buildURL(endpoint: String, page: Int?, limit: Int?) throws -> URL
}

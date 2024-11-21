//
//  NetworkService.swift
//  vikram
//
//  Created by Vikram on 20/11/24.
//

import Foundation

protocol NetworkService {
    func fetchData(from url: URL) async throws -> Data
}

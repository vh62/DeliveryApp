//
//  NetworkService.swift
//  vikram
//
//  Created by Vikram on 20/11/24.
//

import Foundation

class URLNetworkService: NetworkService {
    func fetchData(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}

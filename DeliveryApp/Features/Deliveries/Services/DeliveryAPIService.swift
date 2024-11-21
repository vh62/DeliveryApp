//
//  DeliveryAPIService.swift
//  vikram
//
//  Created by Vikram on 20/11/24.
//

import Foundation

protocol DeliveryService {
    func getDeliveries(page: Int?, limit: Int?) async throws -> [Delivery]
}

class DeliveryAPIService: DeliveryService {
    private let networkService: NetworkService
    private let urlBuilder: URLBuilder
    private let responseHandler: ResponseHandler
    private let endpoint = "https://66e3a4c1d2405277ed11662b.mockapi.io/deliveries"
    
    init(networkService: NetworkService = URLNetworkService(), urlBuilder: URLBuilder = DeliveryURLBuilder(), responseHandler: ResponseHandler = JSONResponseHandler()) {
        self.networkService = networkService
        self.urlBuilder = urlBuilder
        self.responseHandler = responseHandler
    }
    
    func getDeliveries(page: Int? = nil, limit: Int? = nil) async throws -> [Delivery] {
        let url = try urlBuilder.buildURL(endpoint: endpoint, page: page, limit: limit)
        let data = try await networkService.fetchData(from: url)
        return try responseHandler.decode(data)
    }
}


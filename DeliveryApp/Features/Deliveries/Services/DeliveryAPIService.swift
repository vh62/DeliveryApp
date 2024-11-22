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
    private let errorHandler: ErrorHandler
    private let config: APIConfig
    
    init(networkService: NetworkService = URLNetworkService(), urlBuilder: URLBuilder = DeliveryURLBuilder(), responseHandler: ResponseHandler = JSONResponseHandler(),
         errorHandler: ErrorHandler = DeliveryErrorHandler(),
         config: APIConfig = .current) {
        self.networkService = networkService
        self.urlBuilder = urlBuilder
        self.responseHandler = responseHandler
        self.errorHandler = errorHandler
        self.config = config
    }
    
    func getDeliveries(page: Int? = nil, limit: Int? = nil) async throws -> [Delivery] {
        do {
            let url = try urlBuilder.buildURL(endpoint: "\(config.baseURL)/deliveries", page: page, limit: limit)
            let data = try await networkService.fetchData(from: url)
            return try responseHandler.decode(data)
        } catch {
            throw errorHandler.handle(error)
        }
    }
}


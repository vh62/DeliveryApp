//
//  DeliveryViewModel.swift
//  vikram
//
//  Created by Vikram on 17/11/24.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class DeliveryListViewModel {
    private let modelContext: ModelContext
    let itemsPerPage = 20
    var deliveries = [Delivery]()
    var favorites = [Favorite]()
    var isLoading = false
    var currentPage = 1
    

    private let deliveryService: DeliveryService
    
    init( modelContext: ModelContext, deliveryService: DeliveryService = DeliveryAPIService()) {
        self.modelContext = modelContext
        self.deliveryService = deliveryService
    }
        
    func fetchDeliveryData() {
        do {
            let descriptor = FetchDescriptor<Delivery>()
            deliveries = try modelContext.fetch(descriptor)
            
        } catch {
            print("Fetch delivery failed")
        }
    }
    
    @MainActor
    func fetchfavoriteData() {
        do {
            let descriptor = FetchDescriptor<Favorite>()
            favorites = try modelContext.fetch(descriptor)
            print(favorites)
        } catch {
            print("Fetch favorite failed")
        }
    }
    
    func loadMoreContentIfNeeded(currentItem: Delivery?) {
        guard let currentItem = currentItem,
              !isLoading,
              let index = deliveries.firstIndex(where: { $0.id == currentItem.id }),
              index == deliveries.count - 5 else { return }
        
        Task {
            await fetchDeliveries()
        }
    }
    
    @MainActor
    func fetchDeliveries() async {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let newDeliveries = try await deliveryService.getDeliveries(page: currentPage, limit: itemsPerPage)
            
            let descriptor = FetchDescriptor<Delivery>()
            let existingDeliveries = try modelContext.fetch(descriptor)
            let existingIds = Set(existingDeliveries.map { $0.id })
            for delivery in newDeliveries {
                if !existingIds.contains(delivery.id) {
                    modelContext.insert(delivery)
                }
            }
            fetchDeliveryData()
            print(deliveries)
            currentPage += 1
        } catch {
            print("Error fetching deliveries: \(error)")
        }
        
        isLoading = false
    }
    
    @MainActor
    func toggleFavorite(_ delivery: Delivery) {
        if let favourite = favorites.first(where: { $0.delivery?.id == delivery.id }) {
            modelContext.delete(favourite)
        } else {
            print("inserting favorite")
            modelContext.insert(Favorite(delivery: delivery))
        }
        fetchfavoriteData()
    }
    
    func isFavorite(_ delivery: Delivery) -> Bool {
        return favorites.contains(where: { $0.delivery?.id == delivery.id })
    }
    
    func clearDataInLocalStorage() {
        do {
            print("deleting favorites")
            try modelContext.delete(model: Favorite.self)
        } catch {
            print("Unable to clear local storage: \(error)")
        }
    }
}




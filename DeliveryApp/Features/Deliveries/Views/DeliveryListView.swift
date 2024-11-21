//
//  DeliveryList.swift
//  vikram
//
//  Created by Vikram on 17/11/24.
//

import SwiftUI
import SwiftData

struct DeliveryListView: View {
    @Query var deliveries: [Delivery]
    @Query var favorites: [Favorite]
    @Environment(\.modelContext) var modelContext
    @State private var viewModel: DeliveryListViewModel
    
    var body: some View {
        NavigationStack {
            List(deliveries) { delivery in
                NavigationLink {
                    DeliveryDetailView(viewModel: viewModel, delivery: delivery)
                } label: {
                    DeliveryRow(viewModel: viewModel, delivery: delivery)
                        .onAppear {
                            viewModel.loadMoreContentIfNeeded(currentItem: delivery)
                        }
                }
                .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
            .navigationTitle("My Deliveries")
        }
        .task {
//            viewModel.clearDataInLocalStorage()
            await viewModel.fetchDeliveries()
            viewModel.fetchfavoriteData()
        }
    }
    
    init(modelContext: ModelContext) {
        _viewModel = State(wrappedValue: DeliveryListViewModel(modelContext: modelContext))
    }
    
}

#Preview {
    {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContext = ModelContext(try! ModelContainer(
            for: Delivery.self,
            configurations: config
        ))
       
        // Insert some sample data
        for delivery in MockDeliveryData.sampleDeliveries {
            modelContext.insert(delivery)
        }
        
        return DeliveryListView(modelContext: modelContext)
    }()
}

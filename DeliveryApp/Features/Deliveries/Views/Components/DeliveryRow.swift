//
//  DeliveryRow.swift
//  vikram
//
//  Created by Vikram on 17/11/24.
//

import SwiftUI
import SwiftData

struct DeliveryRow: View {
    @State var viewModel: DeliveryListViewModel
    
    let delivery: Delivery
    
    var body: some View {
        HStack {
            RemoteImage(urlString: delivery.goodsPicture)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    Text("From:")
                        .frame(width: 50, alignment: .leading)
                    Text(delivery.route.start)
                }
                HStack(spacing: 10) {
                    Text("To:")
                        .frame(width: 50, alignment: .leading)
                    Text(delivery.route.end)
                }
            }
            Spacer()
            VStack {
                if viewModel.isFavorite(delivery) {
                    Image(systemName: "heart.fill")
                    Text(delivery.deliveryFee)
                } else {
                    Text(delivery.deliveryFee)
                }
            }
        }
        .padding()
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    let modelContext = ModelContext(try! ModelContainer(for: Delivery.self))
    let viewModel = DeliveryListViewModel(modelContext: modelContext)
    
    let delivery = Delivery()
    delivery.goodsPicture = "https://loremflickr.com/320/240/cat?lock=9953"
    delivery.route.start = "123 Start St"
    delivery.route.end = "456 End St"
    delivery.deliveryFee = "$20"
    
    return DeliveryRow(viewModel: viewModel, delivery: delivery)
        .padding()
}

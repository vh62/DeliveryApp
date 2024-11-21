//
//  DeliveryDetailView.swift
//  vikram
//
//  Created by Vikram on 18/11/24.
//

import SwiftUI
import SwiftData

struct DeliveryDetailView: View {
    @State var viewModel: DeliveryListViewModel
    @Environment(\.dismiss) var dismiss
    
    let delivery: Delivery
    
    var body: some View {
        VStack {
            VStack(spacing: 12) {
                HStack {
                    Text("From")
                    Spacer()
                    Text(delivery.route.start)
                        .frame(width:100, alignment: .leading)
                }
                HStack {
                    Text("To")
                    Spacer()
                    Text(delivery.route.end)
                        .frame(width:100, alignment: .leading)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Goods to deliver")
                    RemoteImage(urlString: delivery.goodsPicture)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                HStack {
                    Text("Delivery Fee")
                    Spacer()
                    Text(delivery.deliveryFee)
                }
                Spacer()
                Button {
                    viewModel.toggleFavorite(delivery)
                    print("toggling favourite")
                } label: {
                    FavouriteButton(title: "Add to favourites", isFavourite: viewModel.isFavorite(delivery))
                }
                .padding(.bottom, 30)
                
            }
            .padding(.top, 30)
            .padding()
        }
        .background(Color(.systemBackground))
        .cornerRadius(22)
        .shadow(radius: 40)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("My Deliveries")
                    }
                    .foregroundColor(.mint)
                }
            }
        }
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
    
    return DeliveryDetailView(viewModel: viewModel, delivery: delivery)
}

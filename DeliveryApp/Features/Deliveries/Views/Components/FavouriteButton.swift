//
//  FavouriteButton.swift
//  vikram
//
//  Created by Vikram on 18/11/24.
//

import SwiftUI

struct FavouriteButton: View {
    
    let title: String
    var isFavourite: Bool
    
    var body: some View {
        HStack {
            Text(title)
            Image(systemName: isFavourite ? "heart.fill" : "heart")
        }
        .font(.title3)
        .fontWeight(.semibold)
        .frame(width:260, height: 50)
        .foregroundColor(.white)
        .background(Color(.systemMint))
        .cornerRadius(10)
    }
}

#Preview {
    FavouriteButton(title: "Favourites", isFavourite: true)
}

//
//  FavouriteButton.swift
//  vikram
//
//  Created by Vikram on 18/11/24.
//

import SwiftUI

struct FavoriteButton: View {
    
    let title: String
    var isFavorite: Bool
    
    var body: some View {
        HStack {
            Text(title)
            FavoriteIcon(isFilled: isFavorite, alwaysShow: true)
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
    FavoriteButton(title: "Favourites", isFavorite: true)
}

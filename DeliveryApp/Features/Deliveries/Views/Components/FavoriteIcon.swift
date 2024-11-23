//
//  FavoriteIcon.swift
//  DeliveryApp
//
//  Created by Vikram on 23/11/24.
//

import SwiftUI

struct FavoriteIcon: View {
    let isFilled: Bool
    let alwaysShow: Bool
    
    var body: some View {
        Group {
            if alwaysShow || isFilled {
                Image(systemName: isFilled ? "heart.fill" : "heart")
                    .accessibilityIdentifier(isFilled ? "favoriteIcon-filled" : "favoriteIcon-unfilled")
            }
        }
    }
}


#Preview {
    FavoriteIcon(isFilled: true, alwaysShow: true)
}

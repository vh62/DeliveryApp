//
//  RemoteImage.swift
//  vikram
//
//  Created by Vikram on 18/11/24.
//

import Foundation
import SwiftUI
import Kingfisher

struct RemoteImage: View {
    let urlString: String
    
    var body: some View {
        KFImage(URL(string: urlString))
            .placeholder {
                Image(systemName: "photo")
            }
            .resizable()
            .cacheOriginalImage()
            .diskCacheExpiration(.never)
            .memoryCacheExpiration(.never)
    }
}

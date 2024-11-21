//
//  RemoteImage.swift
//  vikram
//
//  Created by Vikram on 18/11/24.
//

import Foundation
import SwiftUI

struct RemoteImage: View {
    @StateObject private var viewModel = ImageViewModel()
    let urlString: String
    
    var body: some View {
        (viewModel.image?.resizable() ?? Image(systemName: "photo"))
            .onAppear {
                viewModel.loadImage(fromURLString: urlString)
            }
    }
}


#Preview {
    RemoteImage(urlString: "https://loremflickr.com/320/240/cat?lock=9953")
           .frame(width: 150, height: 150)
}

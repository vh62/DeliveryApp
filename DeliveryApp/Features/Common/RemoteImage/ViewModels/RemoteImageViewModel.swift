//
//  ImageViewModel.swift
//  vikram
//
//  Created by Vikram on 20/11/24.
//

import Foundation
import SwiftUI

@MainActor
class ImageViewModel: ObservableObject {
   @Published var image: Image?
   private let imageService: ImageService
   
   init(imageService: ImageService = DefaultImageService()) {
       self.imageService = imageService
   }
   
   func loadImage(fromURLString urlString: String) {
       Task {
           do {
               let uiImage = try await imageService.downloadImage(fromURLString: urlString)
               self.image = Image(uiImage: uiImage)
           } catch {
               print("Error loading image: \(error)")
           }
       }
   }
}

//
//  ImageService.swift
//  vikram
//
//  Created by Vikram on 20/11/24.
//

import UIKit

protocol ImageService {
   func downloadImage(fromURLString: String) async throws -> UIImage
}

class DefaultImageService: ImageService {
   private actor ImageCache {
       private let cache = NSCache<NSString, UIImage>()
       
       func getImage(for key: String) -> UIImage? {
           cache.object(forKey: key as NSString)
       }
       
       func setImage(_ image: UIImage, for key: String) {
           cache.setObject(image, forKey: key as NSString)
       }
   }
   
   private let imageCache = ImageCache()
   private let networkService: NetworkService
   
   init(networkService: NetworkService = URLNetworkService()) {
       self.networkService = networkService
   }
   
   func downloadImage(fromURLString urlString: String) async throws -> UIImage {
       if let cachedImage = await imageCache.getImage(for: urlString) {
           return cachedImage
       }
       
       guard let url = URL(string: urlString) else {
           throw APIError.invalidURL
       }
       
       let data = try await networkService.fetchData(from: url)
       guard let image = UIImage(data: data) else {
           throw APIError.invalidData
       }
       
       await imageCache.setImage(image, for: urlString)
       return image
   }
}

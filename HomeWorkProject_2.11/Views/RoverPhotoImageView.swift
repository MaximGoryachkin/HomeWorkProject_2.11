//
//  RoverPhotoImageView.swift
//  HomeWorkProject_2.11
//
//  Created by Максим on 14.08.2021.
//

import UIKit

class RoverPhotoImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let imageUrl = URL(string: url) else {
            image = UIImage(named: "xmark.seal")
            return
        }
        
        if let cachedImage = getCachedImage(from: imageUrl) {
            image = cachedImage
            return
        }
        
        ImageManager.shared.fetchImage(from: imageUrl) { data, response in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            self.saveDataToCache(with: data, and: response)
        }
    }
    
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let urlResponse = response.url else { return }
        let request = URLRequest(url: urlResponse)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}

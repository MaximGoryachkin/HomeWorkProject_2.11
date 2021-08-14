//
//  NetworkManager.swift
//  HomeWorkProject_2.11
//
//  Created by Максим on 10.08.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with complition: @escaping (Photo) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            do {
                let photos = try JSONDecoder().decode(Photo.self, from: data)
                DispatchQueue.main.async {
                    complition(photos)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}

class ImageManager {
    
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL, complition: @escaping (Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error desctription")
                return
            }
            //guard url == response.url else { return }

            complition(data, response)
            
        }.resume()
    }
    
}

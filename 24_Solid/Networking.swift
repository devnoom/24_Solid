//
//  Networking.swift
//  24_Solid
//
//  Created by MacBook Air on 09.05.24.
//

import Foundation
import UIKit

class Networking {
    
//    func loadImageFromURL(_ urlString: String, completion: @escaping (UIImage?) -> Void) {
//        guard let url = URL(string: urlString) else {
//            completion(nil)
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil, let data = data else {
//                print("Error fetching image:", error?.localizedDescription ?? "Unknown error")
//                completion(nil)
//                return
//            }
//            if let image = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    completion(image)
//                }
//            } else {
//                completion(nil)
//            }
//        }.resume()
//    }
   

//    func loadImage(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completion(nil, error ?? NSError(domain: "Image loading error", code: -1, userInfo: nil))
//                return
//            }
//            completion(data, nil)
//        }.resume()
//    }

}

extension UIImageView {
    func fetchImage(url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _ , _ in
            guard let data = data, let image = UIImage(data: data)
            else {return}
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}

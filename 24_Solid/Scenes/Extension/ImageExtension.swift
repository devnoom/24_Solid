//
//  Extension.swift
//  24_Solid
//
//  Created by MacBook Air on 13.05.24.
//

import UIKit

extension UIImageView {
    func setImage(with url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data)
            else {
                return
            }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}

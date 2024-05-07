//
//  ImagesModal.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//

import Foundation

struct Photo: Codable, Hashable {
    
    let id: String
    let urls: PhotoURLs
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
   
}

struct PhotoURLs: Codable {
    let regular: URL
}

enum Section {
    case main
}

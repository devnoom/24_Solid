//
//  PhotoCellViewModel.swift
//  24_Solid
//
//  Created by MacBook Air on 09.05.24.
//

import Foundation

struct PhotoCellViewModel {
    private var photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    var photoUrl: URL {
        return photo.urls.regular
    }
}



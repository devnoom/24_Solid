//
//  SecondPageViewModel.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//


import Foundation

final class FullScreenViewModel {
    var photos: [Photo]
    var startIndex: Int
    
    init(photos: [Photo], startIndex: Int) {
        self.photos = photos
        self.startIndex = startIndex
    }
}

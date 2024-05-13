//
//  MainPageViewModel.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//

import Foundation
import Networking

protocol MainPageViewModelDelegate: AnyObject {
    func didFetchPhotos(_ photos: [Photo])
    func didFailFetchingPhotos(_ error: Error)
}

final class MainPageViewModel {
    weak var delegate: MainPageViewModelDelegate?
    
        func fetchPhotos() {
               let url = URL(string: "https://api.unsplash.com/photos/?per_page=100&client_id=70ajscEOCcjinB6bM6F7Lksq8ZYkgcBoz64nAtpCmiU")!
               NetworkingService.shared.fetchData(from: url) { [weak self] (result: Result<[Photo], Error>) in
                   switch result {
                               case .success(let photos):
                                   self?.delegate?.didFetchPhotos(photos)
                               case .failure(let error):
                                   self?.delegate?.didFailFetchingPhotos(error)
                               }
               }
           }
}


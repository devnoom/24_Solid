//
//  MainPageViewModel.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//

import Foundation
import Networking

class MainPageViewModel {
    // MARK: - Properties
    
    
    public var photoURLsArray: [PhotoURLs] = []
    public var onPhotoUpdated: ((PhotoURLs) -> Void)?

    // MARK: - Methods
    func didLoad() {
        getPhotos()
    }
    
    func getPhotos() {
        getData()
    }
  
    // MARK: - Get Data
    func getData() {
        let url = URL(string: "https://api.unsplash.com/photos/?per_page=100&client_id=70ajscEOCcjinB6bM6F7Lksq8ZYkgcBoz64nAtpCmiU")!
        NetworkingService.shared.fetchData(from: url) { [weak self] (result: Result<[PhotoURLs], Error>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.photoURLsArray = response
                if let firstPhotoURL = response.first {
                    self.onPhotoUpdated?(firstPhotoURL)
                }
            case .failure(let error):
                print("Error fetching photos:", error)
            }
        }
    }

    // MARK: - Navigation
    func navigateToFullScreen(index: Int) {
        guard index < photoURLsArray.count else { return }
        self.onPhotoUpdated?(photoURLsArray[index])
    }





}


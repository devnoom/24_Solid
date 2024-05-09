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
    var networking = Networking()
    //var mainpagemodel = MainPageViewModel()
    var reloadData: (()-> Void)?
    var photosArray: [Photo] = []
    public var onPhotoUpdated: ((Photo) -> Void)?
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
        NetworkingService.shared.fetchData(from: url) { [weak self] (result: Result<[Photo], Error>) in
            switch result {
            case .success(let response):
                print("Received photos:", response)
                self?.photosArray = response
                //print("as \(self?.photosArray)")
                self!.reloadData?()
            case .failure(let error):
                print("Error fetching photos:", error)
            }
        }
    }
    // MARK: - Navigation
    func navigateToFullScreen(index: Int) {
        guard index < photosArray.count else { return }
        self.onPhotoUpdated?(photosArray[index])
    }
}


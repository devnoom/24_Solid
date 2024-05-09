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
    
    public var photosArray: [Photo] = []
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
            guard let self = self else { return }

            switch result {
            case .success(let response):
                print("Received photos:", response)
                self.photosArray = response
            case .failure(let error):
                print("Error fetching photos:", error)
            }
        }
    }

//    func getData() {
//        let url = URL(string: "https://api.unsplash.com/photos/?per_page=100&client_id=70ajscEOCcjinB6bM6F7Lksq8ZYkgcBoz64nAtpCmiU")!
//        NetworkingService.shared.fetchData(from: url) { [weak self] (result: Result<[Photo], Error>) in
//            guard let self = self else { return }
//            
//            switch result {
//            case .success(let response):
//                self.photosArray = response
//                
////                print("sas \(response)")
////                self.photosArray = response
////                if let  = response.first {
////                    self.onPhotoUpdated?(firstPhotoURL)
//            case .failure(let error):
//                print("Error fetching photos:", error)
//            }
//        }
//    }
    
//    func fetchImage() {
//           guard let url = URL(string: "your_image_url_here") else {
//               // Handle invalid URL
//               return
//           }
//           
//        networking.loadImage(from: url) { data, error in
//               if let error = error {
//                   print("Error: \(error.localizedDescription)")
//               } else if let data = data {
//                   // Handle data (e.g., convert it to UIImage)
//                   // Example:
//                   // let image = UIImage(data: data)
//                   // Do something with the image data
//               }
//           }
//       }

    // MARK: - Navigation
    func navigateToFullScreen(index: Int) {
        guard index < photosArray.count else { return }
        self.onPhotoUpdated?(photosArray[index])
    }
    

        
    





}


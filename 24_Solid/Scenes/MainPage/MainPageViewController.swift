//
//  MainPageViewController.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//

import UIKit

class MainPageViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties
    var dataSource: UICollectionViewDiffableDataSource<Section, Photo>!
    var collectionView: UICollectionView!
    var photos: [Photo] = []
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - UI Setup
    private func setupUI() {
    
        view.addSubview(collectionView)
        
                collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
                collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        
        // Configure DiffableDataSource
                dataSource = UICollectionViewDiffableDataSource<Section, Photo>(collectionView: collectionView) { collectionView, indexPath, photo in
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
                    cell.imageView?.image = photo?.image // Assuming you have an image property in your Photo model
                    return cell
                }
        
        // Fetch photos from API
                fetchPhotos()
                
    }
    func fetchPhotos() {
            let url = URL(string: "https://api.unsplash.com/photos?page=1")!
            var request = URLRequest(url: url)
            request.setValue("Client-ID 70ajscEOCcjinB6bM6F7Lksq8ZYkgcBoz64nAtpCmiU", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error fetching photos:", error)
                    return
                }
                guard let data = data else {
                    print("No data received")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let photos = try decoder.decode([Photo].self, from: data)
                    // Update UI on main thread
                    DispatchQueue.main.async {
                        self.photos = photos
                        self.updateDataSource()
                    }
                } catch {
                    print("Error decoding JSON:", error)
                }
            }.resume()
        }
    
    func updateDataSource() {
            var snapshot = NSDiffableDataSourceSnapshot<Section, Photo>()
            snapshot.appendSections([.main])
            snapshot.appendItems(photos)
            dataSource.apply(snapshot, animatingDifferences: true)
        }
    
}

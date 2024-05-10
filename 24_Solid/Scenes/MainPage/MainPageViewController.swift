//
//  MainPageViewController.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//

import UIKit
import Networking

class MainPageViewController: UIViewController {
    var viewModel = MainPageViewModel()
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Photo>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Photo>
    // MARK: - UI Components
    private var collectionView: UICollectionView! = nil
    
    var dataSource: DataSource!
    private var snapshot = DataSourceSnapshot()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gallery"
        viewModel.didLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureCollectionView()
        configureCollectionViewDataSource()
        setupUI()
    }
    // MARK: - Setup Collection
    
    // MARK: - Setup UI
    private func setupUI() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
        view.addSubview(collectionView)
    }
    
    private func configureCollectionViewDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, photo) -> PhotoCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as! PhotoCell
            cell.configure(with: photo.urls.regular!)
            return cell
        })
    }

    
    private func createDummyDate() {
        var dummyPhotoURLs: [URL] = []
        for photo in viewModel.photosArray {
            if let url = photo.urls.regular {
                dummyPhotoURLs.append(url)
            }
        }
        applySnapshot(photoURLs: dummyPhotoURLs)
    }

    private func applySnapshot(photoURLs: [URL]) {
        snapshot = DataSourceSnapshot()
        snapshot.appendSections([Section.main])
        let dummyPhotos = photoURLs.map { Photo(id: UUID().uuidString, urls: PhotoURLs(regular: $0)) }
        snapshot.appendItems(dummyPhotos)
        dataSource.apply(snapshot, animatingDifferences: false)
    }


    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }



}


extension MainPageViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let photo = dataSource.itemIdentifier(for: indexPath) else {return}
        print(photo)
        
    }
}
    

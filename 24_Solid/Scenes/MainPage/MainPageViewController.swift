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
        
        setupUI()
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.applySnapshot(photos: self?.viewModel.photosArray ?? [])
            }
        }
        viewModel.getPhotos()
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
    
    private func configureCollectionViewLayout() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
        view.addSubview(collectionView)
        
    }
    
    private func configureCollectionViewDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, Photo) -> PhotoCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as! PhotoCell
            cell.configure(with: Photo)
            return cell
        })
    }
    
    private func createDummyDate() {
        var dummyPhotos: [Photo] = []
        
        applySnapshot(photos: dummyPhotos)
    }
    
    private func applySnapshot(photos: [Photo]) {
        snapshot = DataSourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(photos)
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
    

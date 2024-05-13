//
//  SecondPageViewController.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//


import UIKit

final class FullScreenViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: FullScreenViewModel
    private var dataSource: UICollectionViewDiffableDataSource<Int, Photo>!
    
    // MARK: - UI Component

    private lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionViewFlowLayout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.register(FullScreenCell.self, forCellWithReuseIdentifier: FullScreenCell.identifier)
        collectionView.backgroundColor = .systemBackground
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Initialization
    
    init(viewModel: FullScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupCollectionView()
        data()
        applySnapshot()
    }
    
    // MARK: - Setup CollectionView
    
    func setupCollectionView() {
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Apply Snapshot
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Photo>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.photos)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    // MARK: - Load
    
    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) { [weak self] in
            guard let myIndex = self?.viewModel.startIndex else {
                return
            }
            self?.collectionView.scrollToItem(at: IndexPath(row: myIndex, section: 0), at: .centeredHorizontally, animated: false)
            self?.collectionView.isPagingEnabled = true
        }
    }
    
    // MARK: - Data
    
    func data() {
        dataSource = UICollectionViewDiffableDataSource<Int, Photo>(collectionView: collectionView) { collectionView, indexPath, photo in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullScreenCell.identifier, for: indexPath) as? FullScreenCell else {
                fatalError("Cell can not be created")
            }
            //cell.configure(with: URL(string: photo.urls.regular))
            cell.configure(with: photo.urls.regular)

            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FullScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

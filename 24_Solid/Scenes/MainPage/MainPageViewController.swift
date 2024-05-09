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
    
    // MARK: - UI Components
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        return cv
    }()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gallery"
        viewModel.didLoad()
        
        setupCollection()
        setupUI()
        viewModel.reloadData = { [weak self] in
                    self?.collectionView.reloadData()
                }
    }
    // MARK: - Setup Collection
    private func setupCollection() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    // MARK: - Setup UI
    private func setupUI() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
    }
}

    

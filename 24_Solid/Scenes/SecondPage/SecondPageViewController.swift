//
//  SecondPageViewController.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//

import UIKit

final class SecondPageViewController: UIViewController {
    // MARK: - UI Components
    private let fullScreenImage: UIImageView = {
        let fullScreenImage = UIImageView()
        fullScreenImage.backgroundColor = .red
        return fullScreenImage
    }()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(fullScreenImage)
        fullScreenImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fullScreenImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            fullScreenImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            fullScreenImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            fullScreenImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            fullScreenImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            fullScreenImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}

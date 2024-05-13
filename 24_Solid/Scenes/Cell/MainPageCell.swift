//
//  MainPageCell.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//


import UIKit

final class MainPageCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "MainPageCell"
    // MARK: - UI Components
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - UI Setup
    private func setupUI() {
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    // MARK: - Configuration
    func configure(with imageURL: URL?) {
        guard let imageURL = imageURL else {
            print("Image not found")
            return
        }
        image.setImage(with: imageURL)
    }
}

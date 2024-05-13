//
//  FullScreenCell.swift
//  24_Solid
//
//  Created by MacBook Air on 13.05.24.
//

import UIKit

final class FullScreenCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "FullScreenCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    // MARK: - Configuration
    func configure(with imageURL: URL?) {
        guard let imageURL = imageURL else {
            print("Image not found")
            return
        }
        imageView.setImage(with: imageURL)
    }
}

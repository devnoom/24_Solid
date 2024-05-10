//
//  PhotoCell.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//
import UIKit

class PhotoCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoCellReuseIdentifier"
    var photo: Photo
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init(frame: CGRect, photo: Photo) {
        self.photo = photo // Initialize the photo property
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func configure(with url: URL) {
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                }
            }
        }
    }

}


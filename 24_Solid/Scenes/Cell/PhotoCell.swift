//
//  PhotoCell.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//

import UIKit



class PhotoCell: UICollectionViewCell {
    
    private let Image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        //image.backgroundColor = .blue
        return image
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImage()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - SetupImage
    func setupImage() {
        contentView.addSubview(Image)
        
        NSLayoutConstraint.activate([
            Image.topAnchor.constraint(equalTo: contentView.topAnchor),
            Image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            Image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            Image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func updateCell(with item: URL) {
Image.fetchImage(url: item)
       
    }
}

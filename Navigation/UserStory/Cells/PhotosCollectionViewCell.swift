//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Ольга Кучменева on 24.10.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.toAutoLayout()
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupLayout()
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(photo: Photo) {
        photoImageView.image = photo.image
    }
}

private extension PhotosCollectionViewCell {
    func setupLayout(){
        contentView.addSubview(photoImageView)
        
        let constraints = [
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Ольга Кучменева on 24.10.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let photoFirstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()

    private let photoSecondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let photoThirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        return imageView
        }()
    
    private let photoFourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "arrow")
        imageView.toAutoLayout()
        return imageView
    }()
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func configure(photos: Photos) {
        photoFirstImageView.image = UIImage(named: photos.imageFirst)
        photoSecondImageView.image = UIImage(named: photos.imageSecond)
        photoThirdImageView.image = UIImage(named: photos.imageThird)
        photoFourthImageView.image = UIImage(named: photos.imageFourth)
    }

}

private extension PhotosTableViewCell{
    func setupLayout() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(photoFirstImageView)
        contentView.addSubview(photoSecondImageView)
        contentView.addSubview(photoThirdImageView)
        contentView.addSubview(photoFourthImageView)
        
        let constraints = [
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.widthAnchor.constraint(equalToConstant: 100),
            
            arrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowImageView.widthAnchor.constraint(equalToConstant: 24),
            arrowImageView.heightAnchor.constraint(equalToConstant: 24),
            
            photoFirstImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoFirstImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photoFirstImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoFirstImageView.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 12 * 2 - 8 * 3) / 4),
            photoFirstImageView.heightAnchor.constraint(equalTo: photoFirstImageView.widthAnchor),
            
            photoSecondImageView.leadingAnchor.constraint(equalTo: photoFirstImageView.trailingAnchor, constant: 8),
            photoSecondImageView.centerYAnchor.constraint(equalTo: photoFirstImageView.centerYAnchor),
            photoSecondImageView.widthAnchor.constraint(equalTo: photoFirstImageView.widthAnchor),
            photoSecondImageView.heightAnchor.constraint(equalTo: photoFirstImageView.heightAnchor),
            
            photoThirdImageView.leadingAnchor.constraint(equalTo: photoSecondImageView.trailingAnchor, constant: 8),
            photoThirdImageView.centerYAnchor.constraint(equalTo: photoSecondImageView.centerYAnchor),
            photoThirdImageView.widthAnchor.constraint(equalTo: photoSecondImageView.widthAnchor),
            photoThirdImageView.heightAnchor.constraint(equalTo: photoSecondImageView.heightAnchor),
            
            photoFourthImageView.leadingAnchor.constraint(equalTo: photoThirdImageView.trailingAnchor, constant: 8),
            photoFourthImageView.centerYAnchor.constraint(equalTo: photoThirdImageView.centerYAnchor),
            photoFourthImageView.widthAnchor.constraint(equalTo: photoThirdImageView.widthAnchor),
            photoFourthImageView.heightAnchor.constraint(equalTo: photoThirdImageView.heightAnchor),
            photoFourthImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

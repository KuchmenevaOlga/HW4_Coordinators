//
//  photoSectionTableViewCell.swift
//  Navigation
//
//  Created by Борис Шабаев on 24.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class photoSectionTableViewCell: UICollectionViewCell{

   
    func configure(photo: Post) {
        authorLabel.text = post.author
        likesLabel.text = "likes: " + String(post.likes)
        viewsLabel.text = "views: " + String(post.views)
        descriptionLabel.text = post.description
        postImageView.image = UIImage(named: post.image)
    }

}

//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Ольга Кучменева on 22.10.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.toAutoLayout()
        imageView.backgroundColor = .black // нужно было добавить по заданию
        return imageView
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 2
        label.toAutoLayout()
        return label
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 5
        label.toAutoLayout()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLayout()
    }
    
    func configure(post: Post) {
        authorLabel.text = post.author
        likesLabel.text = "likes: " + String(post.likes)
        viewsLabel.text = "views: " + String(post.views)
        descriptionLabel.text = post.description
        postImageView.image = UIImage(named: post.image)
    }
    
}

private extension PostTableViewCell{
    func setupLayout() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        let constraints = [
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 0),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
           
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

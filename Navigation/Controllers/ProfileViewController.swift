//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ольга Кучменева on 07.10.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    weak var coordinator: ProfileCoordinator?
    
    private let profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.backgroundColor = .lightGray
        
        profileHeaderView.avatarImageView.isUserInteractionEnabled = true
        return profileHeaderView
    }()
    
    private var posts = Storage.posts
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private let animationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.toAutoLayout()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        let tapGestureShow = UITapGestureRecognizer(target: self, action: #selector(tapToShowAvatar))
        profileHeaderView.avatarImageView.addGestureRecognizer(tapGestureShow)
        
        let tapGestureHide = UITapGestureRecognizer(target: self, action: #selector(tapToHideAvatar))
        self.closeImageView.addGestureRecognizer(tapGestureHide)
        self.closeImageView.isUserInteractionEnabled = true
    }
    
    private let closeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "close")
        imageView.toAutoLayout()
        return imageView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    private func setupLayout() {
        view.addSubview(tableView)
    
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    private func setupLayoutAnimation(isAnimationStart: Bool) {
        view.addSubview(animationView)
        view.addSubview(profileHeaderView.avatarImageView)
        let constraintsForAnimationAvatar = [
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            profileHeaderView.avatarImageView.centerXAnchor.constraint(equalTo: animationView.centerXAnchor),
            profileHeaderView.avatarImageView.centerYAnchor.constraint(equalTo: animationView.centerYAnchor),
            profileHeaderView.avatarImageView.widthAnchor.constraint(equalTo: animationView.widthAnchor),
            profileHeaderView.avatarImageView.heightAnchor.constraint(equalTo: animationView.widthAnchor)
        ]
        let constraintsForAnimationAvatarFibishing = [
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            profileHeaderView.avatarImageView.topAnchor.constraint(equalTo: animationView.topAnchor, constant: 32),
            profileHeaderView.avatarImageView.leadingAnchor.constraint(equalTo: animationView.leadingAnchor, constant: 16),
            profileHeaderView.avatarImageView.widthAnchor.constraint(equalToConstant: 96),
            profileHeaderView.avatarImageView.heightAnchor.constraint(equalToConstant: 96),
        ]
        
        if isAnimationStart {
            NSLayoutConstraint.activate(constraintsForAnimationAvatar)
        } else {
            NSLayoutConstraint.deactivate(constraintsForAnimationAvatar)
            NSLayoutConstraint.activate(constraintsForAnimationAvatarFibishing)
        }
    }
    
    @objc func tapToShowAvatar() {
        self.profileHeaderView.avatarImageView.removeFromSuperview()
        self.setupLayoutAnimation(isAnimationStart: true)
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.view.setNeedsLayout()
                        self.view.layoutIfNeeded()
                        self.profileHeaderView.avatarImageView.layer.cornerRadius = 0
                        self.profileHeaderView.avatarImageView.layer.borderWidth = 0
                        self.animationView.alpha = 0.9
        }) { finished in
                        self.animationView.addSubview(self.closeImageView)
            self.closeImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
                        self.closeImageView.trailingAnchor.constraint(equalTo: self.animationView.trailingAnchor, constant: -16).isActive = true
                        self.closeImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
                        self.closeImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
                                  
            UIView.animate(withDuration: 0.3,
                                       animations: {
                                            self.view.setNeedsLayout()
                                            self.view.layoutIfNeeded()
                                        }
                        )}
    }
    
    @objc func tapToHideAvatar() {
        self.profileHeaderView.avatarImageView.removeFromSuperview()
        self.setupLayoutAnimation(isAnimationStart: false)
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.view.setNeedsLayout()
                        self.view.layoutIfNeeded()
                        self.profileHeaderView.avatarImageView.layer.borderWidth = 3
                        self.profileHeaderView.avatarImageView.layer.cornerRadius = 48
                        self.animationView.alpha = 0
        }) {finished in
            self.closeImageView.removeFromSuperview()
            self.animationView.removeFromSuperview()
            self.profileHeaderView.avatarImageView.removeFromSuperview()
            self.profileHeaderView.setupLayout()
        }
        
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !posts.isEmpty else { return 0 }
        return posts[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
                
            let photos = posts[indexPath.section][indexPath.row]
            cell.configure(photos: photos as! Photos)

            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:
            PostTableViewCell.self), for: indexPath) as! PostTableViewCell
                
        let post = posts[indexPath.section][indexPath.row]
        cell.configure(post: post as! Post)

        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        return profileHeaderView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
        tableView.deselectRow(at: indexPath, animated: true)
        
            coordinator?.openPhotos()
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
       
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return 0
        }
    }
}

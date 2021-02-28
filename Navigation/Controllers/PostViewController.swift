//
//  PostViewController.swift
//  Navigation
//
//  Created by Olga Kuchmeneva on 12.09.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    weak var coordinator: FeedCoordinator?
    var post: Publication?

    private let postButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(actionWithPost), for: .touchUpInside)
        button.toAutoLayout()
        return button
       }()
    
    @objc func actionWithPost() {
        coordinator?.openInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = post?.title
        postButton.setTitle(title, for: .normal)
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(postButton)
        
        let constraints = [
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postButton.widthAnchor.constraint(equalToConstant: 120),
            postButton.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

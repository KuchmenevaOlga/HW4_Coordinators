//
//  ViewController.swift
//  Navigation
//
//  Created by Olga Kuchmeneva on 12.09.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    weak var coordinator: FeedCoordinator?
    let post = Publication(title: "Пост")

    private let postLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.text = "Показать пост"
        label.toAutoLayout()
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tapPost = UITapGestureRecognizer(target: self, action: #selector(self.tapToShowPost))
        postLabel.addGestureRecognizer(tapPost)
        
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupLayout()
    }
    
    @objc func tapToShowPost() {
        coordinator?.openPost(post: post)
    }
    
    private func setupLayout() {
        view.addSubview(postLabel)
        
        let constraints = [
            postLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postLabel.widthAnchor.constraint(equalToConstant: 120),
            postLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

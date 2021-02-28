//
//  InfoViewController.swift
//  Navigation
//
//  Created by Olga Kuchmeneva on 12.09.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    weak var coordinator: PostCoordinator?
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        super.viewDidLoad()
        setupLayout() 
    }

    private let alertButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("show alert", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.toAutoLayout()
        return button
       }()
    
    @objc func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Удалить пост?", message: "Пост нельзя будет восстановить", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            print("Удалить")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func setupLayout() {
        view.addSubview(alertButton)
        
        let constraints = [
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.widthAnchor.constraint(equalToConstant: 120),
            alertButton.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

//
//  PostCoordinator.swift
//  Navigation
//
//  Created by Ольга Кучменева on 28.02.2021.
//  Copyright © 2021 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class PostCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
 
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PostViewController()
 
        navigationController.present(vc, animated: false)
    }
    
    func openInfo() {
        let vc = InfoViewController()
        navigationController.present(vc, animated: true, completion: nil)
    }

}

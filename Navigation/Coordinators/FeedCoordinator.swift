//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Ольга Кучменева on 28.02.2021.
//  Copyright © 2021 Olga Kuchmeneva. All rights reserved.
//


import UIKit

class FeedCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
 
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = FeedViewController()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 1)

        navigationController.pushViewController(vc, animated: false)
    }
    
    func openPost(post: Publication) {

        let vc = PostViewController()
        vc.post = post
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    func openInfo() {
        let vc = InfoViewController()

        navigationController.present(vc, animated: true, completion: nil)
    }
}

//
//  MainTabBarController.swift
//  instagramProject
//
//  Created by Howard Chang on 3/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

   override func viewDidLoad() {
            super.viewDidLoad()
            viewControllers = [firstVC,secondVC,thirdVC]
            UITabBar.appearance().tintColor = .black
        }

     
        private lazy var firstVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: FeedViewController())
       navController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "eye"), tag: 0)
      
            return navController
     }()
        
        private lazy var secondVC: UINavigationController = {
            let navController = UINavigationController(rootViewController: PhotoCollectionViewController())
          navController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "plus.bubble"), tag: 1)
          return navController
        }()
        
        
        private lazy var thirdVC: UIViewController = {
           let vc = UINavigationController(rootViewController: ProfileViewController())
           vc.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
           return vc
        }()

    }


//
//  MainTabBarController.swift
//  GasBuddy_Challenge
//
//  Created by Yi Zheng on 2019-06-02.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarViewController()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        if index == 1 {
            let layout = UICollectionViewFlowLayout()
            let photoSelectorController = PhotoSelectorController(collectionViewLayout: layout)
            let navPhotoController = UINavigationController(rootViewController: photoSelectorController)
            present(navPhotoController, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    func setupTabBarViewController() {
        tabBar.tintColor = .black
        let layout = UICollectionViewFlowLayout()
        let mainController = templateNavController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: MainController(collectionViewLayout: layout))
        let plusNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "plus_unselected") , selectedImage: #imageLiteral(resourceName: "plus_unselected"))
        viewControllers = [mainController, plusNavController]
        
        guard let items = tabBar.items else {return}
        
        for item in items {
            item.imageInsets = UIEdgeInsets.init(top: 5, left: 0, bottom: -5, right: 0)
        }
        
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController{
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
        
}

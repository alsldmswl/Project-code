//
//  TabBarViewController.swift
//  Tweet
//
//  Created by eun-ji on 2023/04/09.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarViewController: [UIViewController] = TabBarItem.allCases
            .map { tabCase in
                let viewController = tabCase.viewController
                viewController.tabBarItem = UITabBarItem(title: tabCase.title, image: tabCase.icon.default, selectedImage: tabCase.icon.selected)
                
                return viewController
            }
        
        self.viewControllers = tabBarViewController
        
    
    }

}


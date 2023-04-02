//
//  TabBarController.swift
//  MyTranslate
//
//  Created by eun-ji on 2023/04/02.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let translateViewController = TranslateViewController()
        translateViewController.tabBarItem = UITabBarItem(title: "Translate", image: UIImage(systemName: "mic"), selectedImage: UIImage(systemName: "mic.fill"))
        
        let bookmarkViewController = UIViewController()
        bookmarkViewController.tabBarItem = UITabBarItem(title: "bookmark", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        
        viewControllers = [translateViewController, bookmarkViewController]
       
    }


}


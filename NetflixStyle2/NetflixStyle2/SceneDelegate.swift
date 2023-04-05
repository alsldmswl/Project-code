//
//  SceneDelegate.swift
//  NetflixStyle2
//
//  Created by eun-ji on 2023/04/05.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let layout = UICollectionViewFlowLayout()
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        homeViewController.view.backgroundColor = .black
        let rootNavigationController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }

  

}


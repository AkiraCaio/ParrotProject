//
//  PostTabBarViewController.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 29/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class PostTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let controller = StoryboardScene.Main.singUpViewController.instantiate()
//        controller.tabBarItem.image = UIImage
//        controller.tabBarItem.title = ""
        
        var controllers: [UIViewController] = []
        
        let controllerPostViewHome = StoryboardScene.Post.postViewController.instantiate()
        controllerPostViewHome.tabBarItem.image = Asset.iconHomeTabBar.image
        controllerPostViewHome.tabBarItem.title = L10n.Tabbar.home
        controllers.append(controllerPostViewHome)
        
        let controllerProfileViewHome = StoryboardScene.Profile.profileViewController.instantiate()
        controllerProfileViewHome.tabBarItem.image = Asset.iconProfileTabBar.image
        controllerProfileViewHome.tabBarItem.title = L10n.Tabbar.profile
        controllers.append(controllerProfileViewHome)
        
        self.viewControllers = controllers
        
    }
    
}

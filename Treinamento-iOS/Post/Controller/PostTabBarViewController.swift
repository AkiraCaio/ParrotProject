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
        controllerPostViewHome.tabBarItem.title = "Home"

        controllers.append(controllerPostViewHome)
        
        
        self.viewControllers = controllers
    }
    
    
    
    
  

}

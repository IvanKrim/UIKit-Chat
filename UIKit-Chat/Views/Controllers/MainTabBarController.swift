//
//  MainTabBarController.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 21.12.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarConfiguration()
    }
    
    private func generateNavigationViewController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
}

extension MainTabBarController {
    
    private func tabBarConfiguration() {
        let listViewController = ListViewController()
        let peopleViewController = PeopleViewController()
        
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
        let peopleImge = UIImage(systemName: "person.2", withConfiguration: boldConfiguration)!
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfiguration)!
        
        viewControllers = [
            generateNavigationViewController(
                rootViewController: listViewController,
                title: "Conversation",
                image: conversationImage),
            generateNavigationViewController(
                rootViewController: peopleViewController,
                title: "People",
                image: peopleImge)
        ]
    }
}

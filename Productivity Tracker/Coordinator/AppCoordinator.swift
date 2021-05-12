//
//  AppCoordinator.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 13.05.2021..
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {

    func setStartScreen(in window: UIWindow?)
}

class AppCoordinator: AppCoordinatorProtocol {
    private var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController

    }

    func setStartScreen(in window: UIWindow?) {
        let hc = HomeViewController(router: self)

        hc.tabBarItem.image = UIImage(systemName: "house.circle.fill")


        let tabbedController = UITabBarController()
        tabbedController.title = "Productivity Tracker"
        tabbedController.tabBar.barTintColor = .black
        tabbedController.tabBar.tintColor = .white

        tabbedController.viewControllers = [hc]
        
        window?.rootViewController = tabbedController
        window?.makeKeyAndVisible()

    }
}

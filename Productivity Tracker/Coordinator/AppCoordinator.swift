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
        let motivationController = MotivationViewController(router: self)
        let overviewController = OverviewViewController(router: self)
        let homeController = HomeViewController(router: self)
        let activitiesController = ActivitiesViewController(router: self)
        let settingsController = SettingsViewController(router: self)

        motivationController.tabBarItem.image = UIImage(systemName: "hands.sparkles.fill")
        overviewController.tabBarItem.image = UIImage(systemName: "chart.pie.fill")
        homeController.tabBarItem.image = UIImage(systemName: "house.circle.fill")
        activitiesController.tabBarItem.image = UIImage(systemName: "list.bullet")
        settingsController.tabBarItem.image = UIImage(systemName: "gearshape.fill")


        let tabbedController = UITabBarController()
        tabbedController.title = "Productivity Tracker"
        tabbedController.tabBar.barTintColor = .black
        tabbedController.tabBar.tintColor = .white

        tabbedController.viewControllers = [
            motivationController,
            overviewController,
            homeController,
            activitiesController,
            settingsController
        ]
        tabbedController.selectedIndex = 2

        window?.rootViewController = tabbedController
        window?.makeKeyAndVisible()

    }
}

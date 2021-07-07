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
    func setMainScreen()
    func showCreateActivityScreen()
    
}

class AppCoordinator: AppCoordinatorProtocol {
    private var navigationController: UINavigationController!
    
    private var tabbedController: UITabBarController!
    
    private var activitiesPresnter: ActivitiesPresenter?
    
    private weak var window: UIWindow?
    


    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabbedController = UITabBarController()
      
    }
    
    
    func setStartScreen(in window: UIWindow?){
        
        self.window = window
        
        let lvc = LoginViewController(router: self)
        window?.rootViewController = lvc
        window?.makeKeyAndVisible()
    }
 
  
    
    
    func setMainScreen() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let activityRepository = ActivityDataRepository(context: context)
        let activityUseCase = ActivityUseCase(activityRepository: activityRepository)

        let motivationController = MotivationViewController(router: self)
//MARK: - overview view
        let overviewPresenter = OverviewPresenter(router: self, activityUseCase: activityUseCase)
        let overviewController = OverviewViewController(presenter: overviewPresenter)
        
//MARK: - home view
        let homePresenter = HomePresenter(router: self, activityUseCase: activityUseCase)
        let homeController = HomeViewController(presenter: homePresenter)
        
        
//MARK: - activities view

        activitiesPresnter = ActivitiesPresenter(router: self, activityUseCase: activityUseCase)
        let activitiesController = UINavigationController(
            rootViewController:  ActivitiesViewController(
                presenter: activitiesPresnter!
            )
        )
       
        let settingsController = SettingsViewController(router: self)

        motivationController.tabBarItem.image = UIImage(systemName: "hands.sparkles.fill")
        overviewController.tabBarItem.image = UIImage(systemName: "chart.pie.fill")
        homeController.tabBarItem.image = UIImage(systemName: "house.circle.fill")
        activitiesController.tabBarItem.image = UIImage(systemName: "list.bullet")
        settingsController.tabBarItem.image = UIImage(systemName: "gearshape.fill")


        
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
    
    func showCreateActivityScreen(){
        let vc = CreateActivityViewController(
            presenter: activitiesPresnter!
        )
        self.tabbedController.selectedViewController?.present(vc, animated: true, completion: nil)
    }
}

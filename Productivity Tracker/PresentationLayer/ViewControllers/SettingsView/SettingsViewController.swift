//
//  HomeViewController.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 13.05.2021..
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {

    
    var usernameLabel = UILabel()
    var nameLabel = UILabel()
    var logOutButton = UIButton()

    
    
    private var router: AppCoordinatorProtocol!

    convenience init(router: AppCoordinatorProtocol) {
        self.init()
        self.router = router
        title = "Settings"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI
        buildViews()
        
        //funcionality
        logOutButton.addTarget(self, action: #selector(logOutButtonPressed), for: .touchUpInside)
    }

    @objc func logOutButtonPressed(){
        print("log out pressed")
    }

   
}

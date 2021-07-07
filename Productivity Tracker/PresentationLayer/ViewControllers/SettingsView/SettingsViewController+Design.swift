//
//  SettingsViewController+Design.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 08.06.2021..
//

import UIKit
import SnapKit

extension SettingsViewController{
    func buildViews() {
        loadElements()
        addConstraints()
        


    }
    
    func loadElements(){
        view.backgroundColor = .white
        
        //username label
        usernameLabel.text = "Username"
        usernameLabel.font = UIFont(name: "Futura", size: 30)
        usernameLabel.textColor = .black
        
        //name label
        nameLabel.text = "Pero Perić"
        nameLabel.font =  UIFont(name: "Futura", size: 40)
        nameLabel.textColor = .black
        
        //logout button
        logOutButton.backgroundColor = .red
        logOutButton.setTitle("Log out", for: .normal)
        logOutButton.layer.cornerRadius = 35
        
    }

    func addConstraints() {
        
        //username label
        view.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 150, height: 50))
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalToSuperview().offset(30)
            
        }

        //name label
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 200, height: 70))
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(usernameLabel).offset(30)
        }
        
        //logout button
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.width*0.7, height: 70))
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
    }
}

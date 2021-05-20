//
//  ActivitiesViewController+Design.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 19.05.2021..
//

import UIKit
extension ActivitiesViewController{
    
    
    func buildViews(){
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    
    private func createViews() {
        
        //tableview
        tableView = UITableView()
        view.addSubview(tableView)
       
        
        //navigation edit za uređivanje aktivnosti
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editBarButtonPressed))
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        
        //navigation plus item za dodavanje novih aktivnosti
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        let plusImage = UIImage(systemName: "plus")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: plusImage, style: .done, target: self, action: #selector(plusBarButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        
        //tableView
        tableView.register(ActivityCell.self, forCellReuseIdentifier: "ActivityCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = view.frame.height / 10
        tableView.bounces = true
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.separatorColor = .systemGreen
        tableView.allowsSelection = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        tableView.backgroundColor = .white
        
        
    }
    private func styleViews(){
        view.backgroundColor = .systemGreen
        
        
        //prozirnost navigation bar-a
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        
    }
    
    private func defineLayoutForViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.bottom.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
}

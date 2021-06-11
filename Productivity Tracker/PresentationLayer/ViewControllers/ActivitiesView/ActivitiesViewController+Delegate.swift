//
//  ActivitiesViewController+Delegate.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 09.06.2021..
//

import Foundation

extension ActivitiesViewController: ActivitiesViewDelegate {
    func refresh(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

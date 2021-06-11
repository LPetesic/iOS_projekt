//
//  ActivityRepositoryProtocol.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 19.05.2021..
//

protocol ActivityRepositoryProtocol {
    func getItems() throws ->  [ActivityItem]
    func createActivity(name:String)
    func deleteActivity(item: ActivityItem)

}

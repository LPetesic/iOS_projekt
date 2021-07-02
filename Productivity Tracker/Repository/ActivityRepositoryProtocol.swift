//
//  ActivityRepositoryProtocol.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 19.05.2021..
//

import Foundation

protocol ActivityRepositoryProtocol {
    func getItems() throws ->  [ActivityItem]
    func createActivity(name:String, maxGrade:Int)
    func deleteActivity(item: ActivityItem)
    func getOrCreateToday() throws ->  [ActivityScore]
    func updateScore(score: ActivityScore) throws -> Void
    func getThisWeek() -> [Date: [ActivityScore]]

}

//
//  ActivityUseCase.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 19.05.2021..
//


import Foundation
final class ActivityUseCase {
    
    private let activityRepository: ActivityRepositoryProtocol

    init(activityRepository: ActivityRepositoryProtocol) {
        self.activityRepository = activityRepository
    }


    func getItems() throws -> [ActivityItem] {
        try activityRepository.getItems()
    }
    
    func createActivity(name:String, maxGrade:Int){
        activityRepository.createActivity(name: name, maxGrade: maxGrade)
    }
    
    func deleteActivity(item: ActivityItem){
        activityRepository.deleteActivity(item: item)
    }
    
    func getOrCreateToday() throws -> [ActivityScore] {
        try activityRepository.getOrCreateToday()
    }
    
    func updateScore(score: ActivityScore) throws {
        try activityRepository.updateScore(score: score)
    }
    
    func getThisWeek() -> [Date: [ActivityScore]] {
        return activityRepository.getThisWeek()
    }


}

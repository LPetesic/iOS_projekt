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
    
    func createActivity(name:String){
        activityRepository.createActivity(name: name)
    }
    
    func deleteActivity(item: ActivityItem){
        activityRepository.deleteActivity(item: item)
    }


}

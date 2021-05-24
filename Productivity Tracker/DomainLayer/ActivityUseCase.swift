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

    func refreshData() throws {
        try activityRepository.fetchLocalData()
    }

    func getActivities() -> [Activity] {
        activityRepository.fetchLocalData()
    }

    func deleteRestaurant(withId id: Int) {
        activityRepository.deleteLocalData(withId: id)
    }

}

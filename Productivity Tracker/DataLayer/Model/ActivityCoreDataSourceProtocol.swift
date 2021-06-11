//
//  ActivityCoreDataSourceProtocol.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 19.05.2021..
//

import Foundation
protocol ActivityCoreDataSourceProtocol {

    func fetchActivitiesFromCoreData() -> [Any]
    func saveNewActivities(_ activities: [Activity])
    func deleteActivity(withId id: Int)

}

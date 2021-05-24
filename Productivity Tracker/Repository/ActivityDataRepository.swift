////
////  ActivityDataRepository.swift
////  Productivity Tracker
////
////  Created by Antonio Markotic on 19.05.2021..
////
//
//class ActivityDataRepository: ActivityRepositoryProtocol {
//
//    private let coreDataSource: ActivityCoreDataSourceProtocol
//
//    init(coreDataSource: ActivityCoreDataSourceProtocol) {
//        self.coreDataSource = coreDataSource
//    }
//
//    func fetchLocalData() -> [Activity] {
//        coreDataSource.fetchActivitiesFromCoreData()
//    }
//
//    func deleteLocalData(withId id: Int) {
//        coreDataSource.deleteActivity(withId: id)
//    }
//}

//
//  ActivityRepositoryProtocol.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 19.05.2021..
//

protocol ActivityRepositoryProtocol {


    func fetchLocalData() -> [Activity]
    func deleteLocalData(withId id: Int)

}

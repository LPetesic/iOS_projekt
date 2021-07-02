//
//  HomeViewPresenter.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 09.06.2021..
//

import Foundation

class HomePresenter {
    private var router: AppCoordinatorProtocol!
    private var activityUseCase: ActivityUseCase!
    
    //array of Activity items
    var activitiesArray = [ActivityScore]()
    
    convenience init(router: AppCoordinatorProtocol, activityUseCase: ActivityUseCase){
        self.init()
        self.router = router
        self.activityUseCase = activityUseCase
    }
    
    func getItems(){
        do{
            activitiesArray = try activityUseCase.getOrCreateToday()
            //reorder activities by their orderId
            activitiesArray = activitiesArray.sorted(by: {$0.activityItem!.orderID < $1.activityItem!.orderID})
        } catch{
            print(error)
        }
    }
    
    func updateScore(score: ActivityScore) throws {
        try activityUseCase.updateScore(score: score)
    }
}


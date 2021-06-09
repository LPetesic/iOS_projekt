//
//  ActivitiesPresenter.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 09.06.2021..
//

import Foundation
import UIKit

class ActivitiesPresenter {
    weak var delegate: ActivitiesViewDelegate?
    private var router: AppCoordinatorProtocol!
    private var activityUseCase: ActivityUseCase!
    
    var activitiesArray = [ActivityItem]()
    
    convenience init(router: AppCoordinatorProtocol, activityUseCase: ActivityUseCase){
        self.init()
        self.router = router
        self.activityUseCase = activityUseCase
    }
    
    func setView(view: ActivitiesViewDelegate){
        self.delegate = view
    }
    
    func getItems(){
        do{
            //fetch from cd and populate ActivitiesArray
            activitiesArray = try activityUseCase.getItems()
        } catch{
            print("error")
        }
    }
    
    func createActivity(name:String){
        self.activityUseCase.createActivity(name: name)
        self.getItems()
    }
    
    
}

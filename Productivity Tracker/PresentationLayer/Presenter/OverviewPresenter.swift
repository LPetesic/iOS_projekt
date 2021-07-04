//
//  OverviewPresenter.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 09.06.2021..
//

import Foundation

class OverviewPresenter {
    private var router: AppCoordinatorProtocol!
    private var activityUseCase: ActivityUseCase!
    
    
    convenience init(router: AppCoordinatorProtocol, activityUseCase: ActivityUseCase){
        self.init()
        self.router = router
        self.activityUseCase = activityUseCase
    }
    
    func getThisWeek() -> [Date: [ActivityScore]] {
        return activityUseCase.getThisWeek()
    }
}

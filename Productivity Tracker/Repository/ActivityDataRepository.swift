//
//  ActivityDataRepository.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 19.05.2021..
//

import Foundation
import UIKit
import CoreData

class ActivityDataRepository: ActivityRepositoryProtocol {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }

    public func getItems() throws -> [ActivityItem] {
        return try context.fetch(ActivityItem.fetchRequest())
    }
    
    func createActivity(name:String) {
        do{
            let newActivity = ActivityItem(context:context)
            newActivity.name = name
            newActivity.score = 0
            newActivity.createdAt = Date()
            newActivity.orderID = try Int64(getItems().count + 1)
            try context.save()
        }catch{
        }
    }
    
}

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
    
    func createActivity(name:String, maxGrade:Int) {
        do{
            let newActivity = ActivityItem(context:context)
            newActivity.name = name
            newActivity.createdAt = Date()
            newActivity.orderID = try Int64(getItems().count + 1)
            newActivity.maxGrade = Int32(maxGrade)
            try context.save()
        }catch{
        }
    }
    
    func deleteActivity(item: ActivityItem){
        context.delete(item)
        do{
           try  context.save()
        }catch{
        }
    }
    
    func getOrCreateToday() throws ->  [ActivityScore] {
        let items = try context.fetch(ActivityItem.fetchRequest()) as [ActivityItem]
        
        var scores = [ActivityScore]()
        
        for item in items {
            let OitemScores = item.activityScores?.allObjects as? [ActivityScore]
            guard let itemScores = OitemScores else {
                let newSocre = ActivityScore(context: context)
                newSocre.activityItem = item
                newSocre.day = Date()
                newSocre.score = 0
                try context.save()
                scores.append(newSocre)
                continue
            }
            var created = false
            for score in itemScores {
                if Calendar.current.isDateInToday(score.day!) {
                    scores.append(score)
                    created = true
                    break
                }
            }
            if created {
                continue
            }
            let newSocre = ActivityScore(context: context)
            newSocre.activityItem = item
            newSocre.day = Date()
            newSocre.score = 0
            try context.save()
            scores.append(newSocre)
        }
    
        return scores
    }
    
    func updateScore(score: ActivityScore) throws -> Void {
        score.score = (score.score + 1) % (Int32(score.activityItem!.maxGrade) + 1)
        try context.save()
    }
    
}

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
        return try getOrCreateToday(date: Date())
    }
    
    private func getOrCreateToday(date: Date) throws ->  [ActivityScore] {
        let items = try context.fetch(ActivityItem.fetchRequest()) as [ActivityItem]
        
        var scores = [ActivityScore]()
        
        for item in items {
            let OitemScores = item.activityScores?.allObjects as? [ActivityScore]
            guard let itemScores = OitemScores else {
                let newSocre = ActivityScore(context: context)
                newSocre.activityItem = item
                newSocre.day = date
                newSocre.score = 0
                // for dummy data: newSocre.score = Int32(Int.random(in: 1...Int(newSocre.activityItem!.maxGrade)))
                try context.save()
                scores.append(newSocre)
                continue
            }
            var created = false
            for score in itemScores {
                if Calendar.current.isDate(date, equalTo: score.day!, toGranularity: .day) {
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
            newSocre.day = date
            newSocre.score = 0
            // for dummy data: newSocre.score = Int32(Int.random(in: 1...Int(newSocre.activityItem!.maxGrade)))
            try context.save()
            scores.append(newSocre)
        }
    
        return scores
    }
    
    
    
    func updateScore(score: ActivityScore) throws -> Void {
        score.score = (score.score + 1) % (Int32(score.activityItem!.maxGrade) + 1)
        try context.save()
    }
    
    func getThisWeek() -> [Date: [ActivityScore]]{
        var week: [Date: [ActivityScore]] = [:]
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let dayOfWeek = calendar.component(.weekday, from: today)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
        
        for day in days {
            do{
                try week[day] = getOrCreateToday(date: day)
            } catch {
                week[day] = []
            }
            
        }
        
        return week
        
    }
    
}

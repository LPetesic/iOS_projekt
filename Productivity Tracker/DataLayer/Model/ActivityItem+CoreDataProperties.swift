//
//  ActivityItem+CoreDataProperties.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 01.07.2021..
//
//

import Foundation
import CoreData


extension ActivityItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActivityItem> {
        return NSFetchRequest<ActivityItem>(entityName: "ActivityItem")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var maxGrade: Int32
    @NSManaged public var name: String?
    @NSManaged public var orderID: Int64
    @NSManaged public var activityScores: NSSet?

}

// MARK: Generated accessors for activityScores
extension ActivityItem {

    @objc(addActivityScoresObject:)
    @NSManaged public func addToActivityScores(_ value: ActivityScore)

    @objc(removeActivityScoresObject:)
    @NSManaged public func removeFromActivityScores(_ value: ActivityScore)

    @objc(addActivityScores:)
    @NSManaged public func addToActivityScores(_ values: NSSet)

    @objc(removeActivityScores:)
    @NSManaged public func removeFromActivityScores(_ values: NSSet)

}

extension ActivityItem : Identifiable {

}

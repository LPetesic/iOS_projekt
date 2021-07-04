//
//  ActivityScore+CoreDataProperties.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 01.07.2021..
//
//

import Foundation
import CoreData


extension ActivityScore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActivityScore> {
        return NSFetchRequest<ActivityScore>(entityName: "ActivityScore")
    }

    @NSManaged public var score: Int32
    @NSManaged public var day: Date?
    @NSManaged public var activityItem: ActivityItem?

}

extension ActivityScore : Identifiable {

}

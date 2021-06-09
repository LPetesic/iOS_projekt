//
//  ActivityItem+CoreDataProperties.swift
//  
//
//  Created by Antonio Markotic on 19.05.2021..
//
//

import Foundation
import CoreData


extension ActivityItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActivityItem> {
        return NSFetchRequest<ActivityItem>(entityName: "ActivityItem")
    }
    @NSManaged public var score: Int32
    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var orderID: Int64

}

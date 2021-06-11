////
////  ActivityCoreDataSource.swift
////  Productivity Tracker
////
////  Created by Antonio Markotic on 19.05.2021..
////
//
//import CoreData
//
//struct ActivityCoreDataSource: ActivityCoreDataSourceProtocol {
//    private let coreDataContext: NSManagedObjectContext
//
//    init(coreDataContext: NSManagedObjectContext) {
//        self.coreDataContext = coreDataContext
//    }
//
//    func fetchActivitiesFromCoreData() -> [Any] {
//        do{
//            return try coreDataContext.fetch(ActivityItem.fetchRequest())
//            DispatchQueue.main.async {
//             
//            }
//           
//        } catch{
//            print("error")
//        }
//    }
//    
//    func saveNewActivities(_ activities: [Activity]) {
//        let newActivity = ActivityItem(context:coreDataContext)
//        newActivity.name = name
//        newActivity.createdAt = Date()
//        
//        do{
//            try coreDataContext.save()
//       
//        }catch{
//            
//        }
//    }
//    
//    func deleteActivity(withId id: Int) {
//        <#code#>
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}

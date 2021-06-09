//
//  HomeViewController.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 13.05.2021..
//

import UIKit
import SnapKit

class ActivitiesViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var activitiesArray = [ActivityItem]()
    var tableView:UITableView!

   
    private var router: AppCoordinatorProtocol!
    
    convenience init(router: AppCoordinatorProtocol) {
        self.init()
        self.router = router
        title = "Activities"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        buildViews()
        getItems()
        
       
    }
    
    
    
    //Core Data
    func getItems(){
        do{
            //fetch from cd and populate ActivitiesArray
            activitiesArray = try context.fetch(ActivityItem.fetchRequest())
            //reorder that array according to orderIDs
            self.activitiesArray = self.activitiesArray.sorted(by: {$0.orderID < $1.orderID})
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch{
            print("error")
        }
    }
    
    func createActivity(name:String){
        let newActivity = ActivityItem(context:context)
        newActivity.name = name
        newActivity.score = 0
        newActivity.createdAt = Date()
        
        do{
            try context.save()
            getItems()
        }catch{
            
        }
    }
    
    func deleteActivity(item: ActivityItem){
        context.delete(item)
        do{
           try  context.save()
            getItems()
        }catch{
        
        }
    }
    
    
  
    
    //navigation Bar Buttons
    @objc func plusBarButtonPressed(){
        let alert = UIAlertController(title: "New activity", message: "Add new activity", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { (_) in
          let field = alert.textFields?.first
            guard let text = field?.text else{
                return
            }
            self.createActivity(name: text)
            
        }))
        present(alert, animated: true, completion: nil)
    }
        
    @objc func editBarButtonPressed(){
        tableView.isEditing = !tableView.isEditing
    }
    
}


//table view Delegate Methods
extension ActivitiesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


//table view Data Source methods
extension ActivitiesViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitiesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        activitiesArray[indexPath.row].setValue(indexPath.row, forKey: "orderID")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell",for: indexPath)
        cell.textLabel?.text = (activitiesArray[indexPath.row]).name
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .white
      
        return cell
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        //change orderIds of switched activities
        let srcOrderId = activitiesArray[sourceIndexPath.row].orderID
        let destOrderId = activitiesArray[destinationIndexPath.row].orderID
        activitiesArray[sourceIndexPath.row].orderID = destOrderId
        activitiesArray[destinationIndexPath.row].orderID = srcOrderId
    
        //reorder array according to newly set orderIDs
        self.activitiesArray = self.activitiesArray.sorted(by: {$0.orderID < $1.orderID})
        
        //save it to CD
        do{
            try context.save()
        }catch{
            print("Error when tryin to save to CD")
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteActivity(item: activitiesArray[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .none)
        }
    }

}


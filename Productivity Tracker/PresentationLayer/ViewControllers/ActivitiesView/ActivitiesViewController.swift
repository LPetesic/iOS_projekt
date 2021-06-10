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
    
    var tableView:UITableView!

   
    private var presenter: ActivitiesPresenter!
    
    convenience init(presenter: ActivitiesPresenter) {
        self.init()
        self.presenter = presenter
        title = "Activities"
        
        self.presenter.setView(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        buildViews()
        presenter.getItems()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
       
    }
    
  
    
//MARK: - navigation Bar Buttons
    @objc func plusBarButtonPressed(){
        let alert = UIAlertController(title: "New activity", message: "Add new activity", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { (_) in
          let field = alert.textFields?.first
            guard let text = field?.text else{
                return
            }
            self.presenter.createActivity(name: text)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }))
        present(alert, animated: true, completion: nil)
    }
        
    @objc func editBarButtonPressed(){
        tableView.isEditing = !tableView.isEditing
    }
    
}


//MARK: - table view Delegate Methods
extension ActivitiesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


//MARK: - table view Data Source methods
extension ActivitiesViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.activitiesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.activitiesArray[indexPath.row].setValue(indexPath.row, forKey: "orderID")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell",for: indexPath)
        cell.textLabel?.text = (presenter.activitiesArray[indexPath.row]).name
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .white
      
        return cell
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        //change orderIds of switched activities
        let srcOrderId = presenter.activitiesArray[sourceIndexPath.row].orderID
        let destOrderId = presenter.activitiesArray[destinationIndexPath.row].orderID
        presenter.activitiesArray[sourceIndexPath.row].orderID = destOrderId
        presenter.activitiesArray[destinationIndexPath.row].orderID = srcOrderId
    
        //reorder array according to newly set orderIDs
        presenter.activitiesArray = presenter.activitiesArray.sorted(by: {$0.orderID < $1.orderID})
        
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
            self.presenter.deleteActivity(index: indexPath.row)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
//            tableView.deleteRows(at: [indexPath], with: .none)
            
        }
    }

}


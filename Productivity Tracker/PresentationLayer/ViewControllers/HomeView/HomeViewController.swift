//
//  HomeViewController.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 13.05.2021..
//

import UIKit
import SnapKit
import CoreData
import UserNotifications

class HomeViewController: UIViewController {
    
    //collection view
    var collectionView : UICollectionView!
    let spacing:CGFloat = 20.0
    
    
    var notificationLabel = UILabel()
    var arrowImage = UIImageView()
    
    let notificationCenter = UNUserNotificationCenter.current()

    
    private var presenter: HomePresenter!
    
    convenience init(presenter: HomePresenter) {
        self.init()
        self.presenter = presenter
        title = "Home"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (permissionGranted, error) in
            if(!permissionGranted){
                print("Permission denied")
            }else{
                self.scheduleNotification()
            }
        }
       
        createCollectionView()
        presenter.getItems()
        
    }
    
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.getItems()
        
        //if there are no activities, suggest the user to create one with an animation
        if presenter.activitiesArray.count == 0{
            arrowImage.isHidden = false
            notificationLabel.isHidden = false
            buildArrowAndLabel()
            arrowImage.transform = arrowImage.transform.translatedBy(x: 0, y: -10)
            notificationLabel.transform = notificationLabel.transform.translatedBy(x: 0, y: -10)
        }else{
        //if there is at least one activity, hide the animation which suggest adding new activity
            arrowImage.isHidden = true
            notificationLabel.isHidden = true
        }
        collectionView.reloadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: [.autoreverse, .repeat],
                       animations: { [self] in
                        arrowImage.transform = .identity
                        notificationLabel.transform = .identity
                        self.view.layoutIfNeeded()
                       }
        )
    }
    
    
    //osigurava pojavljivanje podsjetnika za korištenje aplikacije svaki dan u 12:00
    func scheduleNotification(){
        notificationCenter.getNotificationSettings { settings in
        let   notificationContent = UNMutableNotificationContent()
            if (settings.authorizationStatus == .authorized){
              
                notificationContent.title = "Hey there, don't forget about your obligations!"
                notificationContent.body = "Make sure you get your daily dose of motivation and crush the rest of the day!"
                notificationContent.badge = NSNumber(value: 1)
                notificationContent.sound = .default
            }
           
                            
            var datComp = DateComponents()
            datComp.hour = 16
            datComp.minute = 02
            let trigger = UNCalendarNotificationTrigger(dateMatching: datComp, repeats: true)
            let request = UNNotificationRequest(identifier: "ID", content: notificationContent, trigger: trigger)
                            UNUserNotificationCenter.current().add(request) { (error : Error?) in
                                if let theError = error {
                                    print(theError.localizedDescription)
                                }
                            }
        }
    }

 
}



//Data source metode
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.activitiesArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ActivityCollectionViewCell
        cell.backgroundColor = .gray
        
        //this specific size is half of both width and height of the cell which makes out cells perfect round shape on all ios devices
        cell.layer.cornerRadius = (view.frame.width - 3*spacing)/4
        cell.populateCell(with: presenter.activitiesArray[indexPath.row])
        
        return cell
    }
}


//delegate metode
extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        do{
            try presenter.updateScore(score: presenter.activitiesArray[indexPath.row])
            presenter.getItems()
        }catch{
            
        }
        collectionView.reloadData()
    }
}


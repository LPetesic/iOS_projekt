//
//  HomeViewController.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 13.05.2021..
//

import UIKit
import SnapKit
import CoreData

class HomeViewController: UIViewController {
    
    private let MAGIC_NUMBER = 6
    
    //collection view
    var collectionView : UICollectionView!
    let spacing:CGFloat = 20.0
    
    
    var notificationLabel = UILabel()
    var arrowImage = UIImageView()
    
    //core data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    private var presenter: HomePresenter!
    
    convenience init(presenter: HomePresenter) {
        self.init()
        self.presenter = presenter
        title = "Home"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
       
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
        presenter.activitiesArray[indexPath.row].score = (presenter.activitiesArray[indexPath.row].score + 1) % Int32(MAGIC_NUMBER)
        do{
            try context.save()
            presenter.getItems()
        }catch{
            
        }
        collectionView.reloadData()
    }
}


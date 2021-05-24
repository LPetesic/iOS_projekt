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
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var activitiesArray = [ActivityItem]()
    var collectionView:UICollectionView!

    private let spacing:CGFloat = 16.0
    
    
    private var router: AppCoordinatorProtocol!
    
    convenience init(router: AppCoordinatorProtocol) {
        self.init()
        self.router = router
        title = "Home"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        createCollectionView()
        getItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {

            super.viewDidAppear(animated)
            getItems()
            collectionView.reloadData()

    }
    
    func createCollectionView(){
        //layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        
        //collectionView
       collectionView = UICollectionView(frame: CGRect(x:0,y:0,width: view.bounds.width, height: view.bounds.height), collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.register(ActivityCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        let size = (collectionView.bounds.width - 3*spacing) / 2
        layout.itemSize = CGSize(width: size, height: size)
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //Core Data fetch
    func getItems(){
        do{
            activitiesArray = try context.fetch(ActivityItem.fetchRequest())
            DispatchQueue.main.async {
            }
        } catch{
            print(error)
        }
    }
}

//Data source metode
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return activitiesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ActivityCollectionViewCell
        cell.backgroundColor = .gray
        cell.populateCell(with: activitiesArray[indexPath.row])
        
        return cell
    }
}


//delegate metode
extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        activitiesArray[indexPath.row].score += 1
        do{
            try context.save()
            getItems()
        }catch{
            
        }
        collectionView.reloadData()
    }
}


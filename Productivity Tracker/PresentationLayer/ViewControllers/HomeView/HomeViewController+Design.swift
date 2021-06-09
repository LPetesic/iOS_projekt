//
//  HomeViewController+Design.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 09.06.2021..
//

import UIKit
import SnapKit

extension HomeViewController{
    
    func createCollectionView(){
        
        //layout of collection view
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
    
    func buildArrowAndLabel(){
        arrowImage.image = UIImage(named: "arrow")!
        view.addSubview(arrowImage)
        arrowImage.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview().offset(view.frame.width/5)
            make.size.equalTo(CGSize(width: 100, height: 150))
        }
        
        notificationLabel.text = "Create New Activity"
        notificationLabel.font = UIFont(name: "Futura", size: 25)
        notificationLabel.textColor = .systemGreen
        notificationLabel.numberOfLines = 0
        notificationLabel.textAlignment = .center
        
        view.addSubview(notificationLabel)
        notificationLabel.snp.makeConstraints { make in
            make.bottom.equalTo(arrowImage.snp.top).offset(5)
            make.size.equalTo(CGSize(width: 200, height: 100))
            make.centerX.equalTo(arrowImage.snp.centerX)
        }
        
        arrowImage.transform = arrowImage.transform.translatedBy(x: 0, y: 0)
        notificationLabel.transform = notificationLabel.transform.translatedBy(x: 0, y: 0)
        
    }
    
}

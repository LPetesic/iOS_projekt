//
//  ActivityCollectionViewCell+Design.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 09.06.2021..
//

import UIKit
import SnapKit


extension ActivityCollectionViewCell{
    func  buildViews(){
        createItems()
        setConstraints()
    }
    
    func createItems(){
        
                
        //nameLabel
        nameLabel.font = UIFont(name: "Futura", size: 20)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        
        //score
        scoreLabel.font = UIFont(name: "Futura", size: 20)
        scoreLabel.textColor = .white
    }
    func setConstraints(){
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        self.addSubview(scoreLabel)
        
        scoreLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            
        }
    }
}

//
//  ActivityCollectionViewCell.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 24.05.2021..
//

import Foundation
import UIKit
class ActivityCollectionViewCell: UICollectionViewCell{
    var nameLabel = UILabel()
    var scoreLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createItems()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createItems(){
        //nameLabel
        nameLabel.font = UIFont(name: "Futura", size: 20)
        nameLabel.textColor = .white
        
        //score
        scoreLabel.font = UIFont(name: "Futura", size: 20)
        scoreLabel.textColor = .white
    }
    func setConstraints(){
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
        
        self.addSubview(scoreLabel)
        
        scoreLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(20)
        }
    }
    
    func populateCell(with cell: ActivityItem){
        nameLabel.text = cell.name
        scoreLabel.text = ("\(cell.score)")
    }
}

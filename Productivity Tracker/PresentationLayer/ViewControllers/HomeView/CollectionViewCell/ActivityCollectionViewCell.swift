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
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
    func populateCell(with cell: ActivityItem){
        nameLabel.text = cell.name
        scoreLabel.text = ("\(cell.score)")
    }
}

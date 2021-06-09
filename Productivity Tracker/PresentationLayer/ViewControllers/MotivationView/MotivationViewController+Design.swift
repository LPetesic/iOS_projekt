//
//  MotivationViewController+Design.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 08.06.2021..
//

import UIKit
import SnapKit

extension MotivationViewController{
    
    func buildViews(){
        loadElements()
        setConstraints()
    }
    
    
    func loadElements(){
        // image view
        imageView.image = UIImage(named: "motivationImage1")
        imageView.alpha = 0.2
        
        //motivation quote
        quoteLabel.font = UIFont.italicSystemFont(ofSize: 30)
        quoteLabel.numberOfLines = 0
        quoteLabel.textAlignment = .center
        quoteLabel.alpha = 0
        
        
        //quote author
        authorLabel.font = UIFont(name: "Futura", size: 20)
        authorLabel.textAlignment = .right
        authorLabel.alpha = 0
    }
    
    func setConstraints(){
        //imageview
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        
        //motivation quote
        view.addSubview(quoteLabel)
        quoteLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
            make.width.equalTo(view.frame.width).multipliedBy(0.7)
        }
        quoteLabel.transform = quoteLabel.transform.translatedBy(x: 0, y: 0)
        
        //quote author
        view.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { make in
            make.trailing.equalTo(quoteLabel.snp.trailing).offset(-50)
            make.top.equalTo(quoteLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        authorLabel.transform = authorLabel.transform.translatedBy(x: 0, y: 0)
    }
    
    
    
}

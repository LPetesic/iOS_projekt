//
//  OverviewViewController+Design.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 05.07.2021..
//

import UIKit
import SnapKit


extension OverviewViewController{
    func buildViews(){
        loadElements()
        addConstraints()
    }
    
    private func loadElements() {
        view.backgroundColor = .lightGray
        
//        meditiranje.text = "Meditiranje"
        meditiranje.textAlignment = .left
        meditiranje.font = UIFont(name: "Futura", size: 22)
        meditiranje.textColor = .black
        
        titleLabel = UILabel()
        titleLabel.text = "Last 7 days"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Futura-Bold", size: 35)
        titleLabel.textColor = .black
        
        
        view.addSubview(titleLabel)
        view.addSubview(meditiranje)
        view.addSubview(barChart)
    
       
    }
    
    private func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)

            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
        meditiranje.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(titleLabel.snp.bottom).offset(130)
            make.centerX.equalToSuperview()
        }
        
        barChart.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
         
        }
        
        
      
       
    }
}

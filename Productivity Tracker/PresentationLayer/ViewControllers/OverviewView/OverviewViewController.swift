//
//  HomeViewController.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 13.05.2021..
//

import UIKit
import SnapKit

class OverviewViewController: UIViewController {

    private var titleLabel: UILabel!
    private var presenter: OverviewPresenter!
    private var weekLabel: UILabel! // TEMP

    convenience init(presenter: OverviewPresenter) {
        self.init()
        self.presenter = presenter
        title = "Overview"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(presenter.getThisWeek())
        weekLabel.text = stryngifyDict(dict: presenter.getThisWeek())
    }
    
    func stryngifyDict(dict: [Date: [ActivityScore]]) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        var res = ""
        for day in Array(dict.keys).sorted(by: <){
            res += "\(formatter.string(from: day)): ["
            for score in dict[day, default: []] {
                res += "\(score.activityItem!.name ?? ""): \(score.score), "
            }
            res += "]\n\n"
            
        }
        return res
    }


    private func buildViews() {
        view.backgroundColor = .orange

        titleLabel = UILabel()
        titleLabel.text = "Overview"
        titleLabel.textAlignment = .center
        
        weekLabel = UILabel()
        weekLabel.text = stryngifyDict(dict: presenter.getThisWeek())
        weekLabel.textColor = .black
        weekLabel.contentMode = .scaleToFill
        weekLabel.numberOfLines = 24
        

        view.addSubview(titleLabel)
        view.addSubview(weekLabel)
    }

    private func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
        weekLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.9)
        }

    }
}

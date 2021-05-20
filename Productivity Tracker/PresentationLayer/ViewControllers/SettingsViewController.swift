//
//  HomeViewController.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 13.05.2021..
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {

    private var titleLabel: UILabel!
    private var router: AppCoordinatorProtocol!

    convenience init(router: AppCoordinatorProtocol) {
        self.init()
        self.router = router
        title = "Settings"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        addConstraints()
    }


    private func buildViews() {
        view.backgroundColor = .gray

        titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.textAlignment = .center

        view.addSubview(titleLabel)
    }

    private func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

    }
}

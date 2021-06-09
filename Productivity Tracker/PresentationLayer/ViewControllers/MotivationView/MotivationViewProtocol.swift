//
//  MotivationViewProtocol.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 09.06.2021..
//

import Foundation
protocol MotivationViewProtocol: AnyObject{
    func populateView(quote : [Quote])
    func showError()
}

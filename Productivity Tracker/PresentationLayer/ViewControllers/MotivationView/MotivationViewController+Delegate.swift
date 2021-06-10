//
//  MotivationViewController+Delegate.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 09.06.2021..
//

import Foundation

extension MotivationViewController: MotivationViewProtocol{
    func populateView(quote: [Quote]) {
        quoteLabel.text = quote[0].quote
        authorLabel.text = quote[0].author
    }
    
    func showError() {

        if (quoteLabel.text == nil){
            presentErrorAlert()
        }
       
    }
}

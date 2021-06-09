//
//  MotivationPresenter.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 09.06.2021..
//

import UIKit


class MotivationPresenter {
    
    private let nService: NetworkingProtocol
    weak private var motivationViewDelegate: MotivationViewProtocol?
    
    init(networking: NetworkService) {
        self.nService = networking
    }
    
    func setMotivationViewDelegate(motivationViewDelegate: MotivationViewController){
        self.motivationViewDelegate = motivationViewDelegate
    }
    
    
    
    func getData(){
        nService.fetchQuoteOfTheDay{ [weak self] (result : Result<[Quote], RequestError>) in
            guard let self = self else {
                return
            }
            switch result{
            case .failure(let error):
                print(error)
                self.motivationViewDelegate?.showError()
            case .success(let value):
                self.motivationViewDelegate?.populateView(quote : value)
            }
        }
    }
}

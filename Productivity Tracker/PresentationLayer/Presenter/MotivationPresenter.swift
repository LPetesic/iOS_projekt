//
//  MotivationPresenter.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 09.06.2021..
//

import UIKit


class MotivationPresenter {
    
    private let nService: NetworkService
    weak private var motivationViewDelegate: MotivationViewProtocol?
    
    init(networking: NetworkService) {
        self.nService = networking
    }
    
    func setMotivationViewDelegate(motivationViewDelegate: MotivationViewController){
        self.motivationViewDelegate = motivationViewDelegate
    }
    

    
    func getData(){
        let request = nService.fetchQuoteOfTheDay()
        nService.executeUrlRequest(request){ [self] (result : Result<[Quote], RequestError>) in
            
            switch result{
            case .failure(let error):
                print(error)
                motivationViewDelegate?.showError()
            case .success(let value):
                
                motivationViewDelegate?.populateView(quote : value)
            }
        }
        
        
        
        
        
    }
}

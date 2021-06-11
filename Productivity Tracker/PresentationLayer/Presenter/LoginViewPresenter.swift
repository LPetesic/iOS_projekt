//
//  LoginViewPresenter.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 10.06.2021..
//

import UIKit


class LoginViewPresenter {
    
    private let nService: NetworkingProtocol
    weak private var loginViewDelegate: LoginViewProtocol?
    
    init(networking: NetworkService) {
        self.nService = networking
    }
    
    func setLoginViewDelegate(loginViewDelegate: LoginViewController){
        self.loginViewDelegate = loginViewDelegate
    }
    
    func validateLogin(email: String, password: String){
    
      
        nService.validateLogin(email:email, pass: password) { [weak self] (result : Result<LoginResponse, RequestError>) in
            
            switch result{
            case .failure(_):
                self?.loginViewDelegate?.showError()
            case .success(_):
                self?.loginViewDelegate?.completed()
            
                
            }
        }
        
    }
    
    
    
    
}

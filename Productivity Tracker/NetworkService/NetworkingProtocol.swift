//
//  NetworkingProtocol.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 08.06.2021..
//

import UIKit


protocol NetworkingProtocol {
    
    func fetchQuoteOfTheDay(completionHandler:@escaping (Result<[Quote], RequestError>) -> Void)
    func validateLogin(email: String, pass: String, completionHandler: @escaping (Result<LoginResponse, RequestError>) -> Void)
}

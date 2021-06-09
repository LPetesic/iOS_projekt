//
//  NetworkService.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 08.06.2021..
//

import Foundation
import UIKit



class NetworkService: NetworkingProtocol{
    
    private let defaults = UserDefaults()

    
    private func executeUrlRequest<T: Codable>(_ request: URLRequest, completionHandler: @escaping
                                        (Result<[T], RequestError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response,
                                                                   err in
            
            guard err == nil else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.clientError))
                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.serverError))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.noData))
                }
                return
            }
            
            guard let value = try? JSONDecoder().decode([T].self, from: data) else{
                DispatchQueue.main.async {
                    completionHandler(.failure(.dataDecodingError))
                }
                return
            }
            DispatchQueue.main.async {
                completionHandler(.success(value))
            }
        }
        dataTask.resume()
    }
    
    
    // API Link: https://zenquotes.io
    public func fetchQuoteOfTheDay(completionHandler:@escaping (Result<[Quote], RequestError>) -> Void){
        guard let url = URL(string: "https://zenquotes.io/api/today") else{
            fatalError("Url not working")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        self.executeUrlRequest(request, completionHandler: completionHandler)
        
    }
}

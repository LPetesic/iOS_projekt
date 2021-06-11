//
//  RequestError.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 08.06.2021..
//


import Foundation
enum RequestError: Error {
    case clientError
    case serverError
    case noData
    case dataDecodingError
}

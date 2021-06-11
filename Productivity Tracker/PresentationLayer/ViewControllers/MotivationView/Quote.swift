//
//  Quote.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 08.06.2021..
//


struct Quote: Codable{
    
    var quote : String
    var author : String
    enum CodingKeys: String, CodingKey{
        case author = "a"
        case quote = "q"
    }
}

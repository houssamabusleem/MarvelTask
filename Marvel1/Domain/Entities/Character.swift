//
//  Character.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
struct Character : Codable {
    let id : Int?
    let name : String?
    let description : String?
    let modified : String?
    let thumbnail : Thumbnail?
    let resourceURI : String?
   let comics : Comics?
    let series : Series?
    let events : Events?
    let urls : [Urls]?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case description = "description"
        case modified = "modified"
        case thumbnail
        case resourceURI = "resourceURI"
        case comics
        case series
        case events
        case urls = "urls"
    }
    

    
}

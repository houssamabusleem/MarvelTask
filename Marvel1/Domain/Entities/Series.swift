//
//  Events.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation

struct Series : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [Items]?
    let returned : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }
    
}

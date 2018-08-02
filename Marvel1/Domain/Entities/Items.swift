//
//  Items.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
struct Items : Codable {
    let resourceURI : String?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        
        case resourceURI = "resourceURI"
        case name = "name"
    }
    

    
}

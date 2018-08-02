//
//  Urls.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
struct Urls : Codable {
    let type : String?
    let url : String?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case url = "url"
    }
    
}

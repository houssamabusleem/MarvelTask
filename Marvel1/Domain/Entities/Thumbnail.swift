//
//  Thumbnail.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
struct Thumbnail : Codable {
    
    let path : String?
    let ext : String?
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case ext = "extension"
        
    }
    
    func thumbnail_url(size:String)->String{
        return self.path!+"/"+size+"."+ext!
        
        //http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/landscape_medium.jpg
    }
    
}








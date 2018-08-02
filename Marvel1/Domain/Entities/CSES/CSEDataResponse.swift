//
//  ComicDataResponse.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
class CSEDataResponse:Codable{
    let offset : Int?
    let limit : Int?
    let total :Int?
    let count:Int?
    let results : [CSEDetailed]?
}

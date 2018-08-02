//
//  ComicResponse.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
//ComicsStoriesEventsSeries response to get the image url
class CSESResponse: Codable {
    let code :Int?
    let status:String?
    let copyright:String?
    let attributionText: String?
    let attributionHTML:String?
    let data : CSEDataResponse?
   
//    enum CodingKeys: String, CodingKey {
//
////    case code = ""Code
//
    }


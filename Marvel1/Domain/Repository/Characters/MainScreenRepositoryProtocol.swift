//
//  MainScreenRepositoryProtocol.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation

protocol MainScreenRepositoryProtocol {
    
    func getAllCharacters(name:String?,offset:Int?,completionHandler:@escaping (ResultData)->(),failure: @escaping (NSError) -> Void)
}




//
//  CSERepositoryProtocol.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
protocol CSERepositoryProtocol {
    
    
    func getCharacterCSESCollectionsPhotos(imgContainerUri: String, completionHandler: @escaping ([CSEDetailed]) -> (), failure: @escaping (NSError) -> Void)
}


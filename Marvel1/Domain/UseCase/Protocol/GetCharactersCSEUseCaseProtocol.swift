//
//  GetCharactersCSEUseCaseProtocol.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
protocol GetCharactersCSEUseCaseProtocol {
    
    func execute(url:String,result: @escaping ([CSEDetailed])->(),failure:@escaping (NSError)->())

}

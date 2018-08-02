//
//  GetCharactersComicsUseCase.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation

class GetcharactersComicsUseCase: GetCharactersCSEUseCaseProtocol{
    
    var repo: CSERepositoryProtocol?
    
    func execute(url:String,result: @escaping ([CSEDetailed])->(),failure:@escaping (NSError)->()){
       
        repo = ServiceLocator.getCharComicsRepo()
    
        repo?.getCharacterCSESCollectionsPhotos(imgContainerUri: url, completionHandler: {
            repoResult in
            result(repoResult)
        }, failure: { (error) in
            failure(error)
        })
        
    }
}

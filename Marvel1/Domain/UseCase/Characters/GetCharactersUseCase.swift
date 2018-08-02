 //
//  GetCharactersUsecase.swift
 //  Marvel1
 //
 //  Created by Houssam Abusleem on 7/20/18.
 //  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation

protocol GetCharactersUseCaseProtocol {
    typealias resultCharacters = (ResultData)->()
    func execute(name:String?,offset:Int?,result: @escaping resultCharacters,failure:@escaping (NSError)->())
}


class GetCharactersUseCase: GetCharactersUseCaseProtocol {
    var repo: MainScreenRepositoryProtocol?
    
    func execute(name:String?,offset:Int?,result: @escaping resultCharacters,failure:@escaping (NSError)->()){
        
        self.repo = ServiceLocator.MainScreenRepository()
        repo?.getAllCharacters(name: name, offset:offset, completionHandler: { (repoResult) in
                            result(repoResult)
                        }, failure: {
                            (error) in print(error)
  failure(error)
                            
                        })
//        ServiceLocator.MainScreenRepository(completion: {
//            res in
//            self.repo = res
//            self.repo?.getAllCharacters(name: name, offset:offset, completionHandler: { (repoResult) in
//                result(repoResult)
//            }, failure: {
//                (str) in print(str)
//            })
//        })
        
    }
}

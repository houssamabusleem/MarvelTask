//
//  MainScreenRepository.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation

class MainScreenOnlineRepository :MainScreenRepositoryProtocol {
    func getAllCharacters(name: String?, offset: Int?, completionHandler: @escaping (ResultData) -> (), failure: @escaping (NSError) -> Void) {
        
        
        let url = ApiController().characters_url
        let params = ApiController().addParameters(nameStartsWith: name, offset: offset)
        
        let header = ApiController().getHeader
        
        
        AlamaofireClient().request(strURL: url, params: params, headers: header as? [String : String], success:
            { (data) in
                
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(CharacterResponse.self, from: data!)
                    
                    if (result.code == 404 ) {
//                        failure(result.status as! NSError )
                    }else{
                        let datares = result.resultData // returns `nil` if data is empty
                        completionHandler(datares!)
                    }
                    
                } catch (let error){
                    print("Error: \(error)")
                    failure((error.localizedDescription as? NSError)!)
                }
        }) { (error) in
            
            print(error)
        }
    }
    
    
    
}

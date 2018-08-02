//
//  EventsRepositoryProtocol.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation


class EventsOnlineRepository : CSERepositoryProtocol{
    func getCharacterCSESCollectionsPhotos(imgContainerUri: String, completionHandler: @escaping ([CSEDetailed]) -> (), failure: @escaping (NSError) -> Void) {
        let url = imgContainerUri
        let params = ApiController().addParameters(nameStartsWith: nil, offset: nil)
        let header = ApiController().getHeader
        
        
        AlamaofireClient().request(strURL: url, params: params, headers: header as? [String : String], success:
            { (data) in
                
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(CSESResponse.self, from: data!)
                    if (result.code == 404) {
                        return
                    }else{
                        let datares = result.data // returns `nil` if data is empty
                        let res = datares?.results  //ID-TITLE-THUMBNAIL
                        completionHandler(res!)
                    }
                    
                } catch (let error){
                    print("Error: \(error)")
                    failure(error as NSError)
                }
        }) { (error) in
            
            print(error)
            failure(error)
        }
    }
}
